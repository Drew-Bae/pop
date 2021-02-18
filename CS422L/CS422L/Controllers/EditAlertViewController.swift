//
//  EditAlertViewController.swift
//  CS422L
//
//  Created by Jonathan Sligh on 2/18/21.
//

import UIKit

class EditAlertViewController: UIViewController {

    @IBOutlet var alertView: UIView!
    @IBOutlet var termEditText: UITextField!
    @IBOutlet var definitionEditText: UITextField!
    //card from FlashCardSetDetailViewController
    var card: Flashcard = Flashcard()
    //use this later to do things to the flashcards potentially
    var parentVC: FlashCardSetDetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup()
    {
        alertView.layer.cornerRadius = 8.0
        //set term/def
        termEditText.text = card.term
        definitionEditText.text = card.definition
        //make it so it shows this is editable
        termEditText.becomeFirstResponder()
    }
    
    @IBAction func deleteFlashcard(_ sender: Any) {
        //nothing yet but eventually delete the flashcard
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        self.dismiss(animated: false, completion: {
            //do something / save the edits
        })
    }
    
}
