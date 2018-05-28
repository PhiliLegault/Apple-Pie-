//
//  ViewController.swift
//  Apple Pie
//
//  Created by Philippe Legault on 2018-05-25.
//  Copyright © 2018 Philippe Legault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["dog", "cat", "hamburger", "elephant", "carrot"]
    let incorrectMovesAllowed = 7
    var totalWins = 0
    var totalLoses = 0
    
    var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateUI(){
        scoreLabel.text = "Wins: \(totalWins), Loses \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

}

