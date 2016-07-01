//
//  TrieNode.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 6/4/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation

class TrieNode {
    var letter:Character
    var fullWord:Bool
    var leadingLetters:String
    var child = [Character:TrieNode]()
    
    init (letter:Character, leadingLetters:String, fullWord:Bool) {
        self.letter = letter
        self.fullWord = fullWord
        self.leadingLetters = leadingLetters
    }
}

