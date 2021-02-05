//
//  ViewController.swift
//  CS422L
//
//  Created by Jonathan Sligh on 1/29/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet var collectionView: UICollectionView!
    var sets: [FlashcardSet] = [FlashcardSet]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let setClass = FlashcardSet()
        //connect hard coded collection to sets
    
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return number of items
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SetCell", for: indexPath) as! FlashcardSetCollectionCell
        //setup cell display here
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //go to new view
        //performSegue(withIdentifier: "GoToDetail", sender: self)
        
    }
    
    
}

