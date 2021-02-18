//
//  FlashCardSetDetailActivity.swift
//  CS422L
//
//  Created by Jonathan Sligh on 2/3/21.
//

import Foundation
import UIKit

class FlashCardSetDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var cards: [Flashcard] = [Flashcard]()
    @IBOutlet var buttonView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var studyButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = Flashcard.getHardCodedCollection()
        tableView.delegate = self
        tableView.dataSource = self
        makeItPretty()
    }
    
    //adds card
    @IBAction func addCard(_ sender: Any) {
        let newCard = Flashcard()
        newCard.term = "Term \(cards.count + 1)"
        newCard.definition = "Definition \(cards.count + 1)"
        cards.append(newCard)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! FlashcardTableViewCell
        cell.flashcardLabel.text = cards[indexPath.row].term
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "\(cards[indexPath.row].term)", message: "\(cards[indexPath.row].definition)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {_ in
            self.createCustomAlert(card: self.cards[indexPath.row])
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func createCustomAlert(card: Flashcard)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = sb.instantiateViewController(identifier: "EditAlertViewController") as! EditAlertViewController
        alertVC.parentVC = self
        alertVC.card = card
        alertVC.modalPresentationStyle = .overCurrentContext
        self.present(alertVC, animated: false, completion: nil)
    }
    
    //just a function to make everything look nice
    func makeItPretty()
    {
        buttonView.layer.cornerRadius = 8.0
        buttonView.layer.borderColor = UIColor.purple.cgColor
        buttonView.layer.borderWidth = 2.0
        deleteButton.layer.cornerRadius = 8.0
        studyButton.layer.cornerRadius = 8.0
        addButton.layer.cornerRadius = 8.0
    }
    
    
}
