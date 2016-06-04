//
//  TrieManager.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation

class TrieManager {
    var root:TrieNode = TrieNode(letter1: "\0", fullWord2: false)
    
    func insertWord(word:String) {
        let wordLength = word.characters.count - 1
        var currentNode:TrieNode? = root
        var letterCounter = 0
        
        
        for letter in word.characters {
            let fulllWord = letterCounter == wordLength ? true : false
            letterCounter = letterCounter + 1
            
            if currentNode!.child[letter] == nil {
                currentNode!.child[letter] = TrieNode(letter1: letter, fullWord2: fulllWord)
            }
            
            currentNode = currentNode!.child[letter]
        }
    }
    
    func find(key:String) {
        let keyLength = key.characters.count
        
        var currentNode:TrieNode? = root
        var characterCount = 0
        
        for character in key.characters {
            currentNode = currentNode!.child[character]
            
            if currentNode == nil {
                return
            }
            
            characterCount = characterCount + 1
            
            if characterCount == keyLength && currentNode!.fullWord == true { // we reached destination
                print("Key \(key) Found!")
                return
            }
        }
    }
}
