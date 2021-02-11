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
        return cell
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
