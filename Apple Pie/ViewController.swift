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
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLoses = 0 {
        didSet{
            newRound()
        }
    }
    
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
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLoses += 1
        } else if currentGame.word == currentGame.formatedWord {
            totalWins += 1
        } else {
            updateUI()
        }
        
        
    }
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButton(true)
            updateUI()
        }else {
            enableLetterButton(false)
        }
    }

    func enableLetterButton(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
        
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formatedWord.characters{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Loses \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

}

