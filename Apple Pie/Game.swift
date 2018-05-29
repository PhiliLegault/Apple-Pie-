//
//  Game.swift
//  Apple Pie
//
//  Created by Philippe Legault on 2018-05-28.
//  Copyright © 2018 Philippe Legault. All rights reserved.
//

import Foundation

struct Game {
    var word : String
    var incorrectMovesRemaining : Int
    var guessedLetters = [Character]()
   
    var formatedWord: String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
}
