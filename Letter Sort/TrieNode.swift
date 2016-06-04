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
    var child = [Character:TrieNode]()
    
    init (letter1:Character, fullWord2:Bool) {
        letter = letter1
        fullWord = fullWord2
    }
}
