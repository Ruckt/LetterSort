//
//  TrieManager.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation

class TrieManager {
    var root:TrieNode = TrieNode(letter: "\0", leadingLetters: "", nodeValue: 0, fullWord: false)
    
    func insertWord(word:String) {
        let wordLength = word.characters.count - 1
        var currentNode:TrieNode? = root
        var letterCounter = 0
        
        for letter in word.characters {
            let fulllWord = letterCounter == wordLength ? true : false
            letterCounter = letterCounter + 1
            let leadingLetters = (currentNode?.leadingLetters)! + String(letter)
            let nodeValue = (currentNode?.nodeValue)! + letterValue[String(letter)]!
            
            if currentNode!.child[letter] == nil {
                currentNode!.child[letter] = TrieNode(letter: letter, leadingLetters: leadingLetters, nodeValue: nodeValue, fullWord: fulllWord)
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
           // print("Leading letters: \(currentNode!.leadingLetters)")
            
            if characterCount == keyLength && currentNode!.fullWord == true { // we reached destination
                print("Key \(key) Found!")
                return
            }
        }
    }
    
    func findAnagramsOf(key:String, node:TrieNode) -> [String : Int] {
       // print("Node: \(node.letter)")
        let keyLength = key.characters.count

        var wordList:[String : Int] = [:]
        
        if node.fullWord {
         print("Leading letters: \(node.leadingLetters)")
            wordList[node.leadingLetters] = node.nodeValue
        }
        
        // No need to proceed if there are no more nodes or letters to evaluate
        if node.child.count == 0 || keyLength <= 1{
            return wordList
        }
        
        // Remove current letter and traverse rest of letters.
        var remainingKey = ""
        var uniqueRemainingKey = Set<Character>()
        var found = false
        
    
        for char in key.characters {
            if char == node.letter && !found {
                found = true
            } else {
                remainingKey = remainingKey + String(char)
                uniqueRemainingKey.insert(char)
            }
        }

        // Use uniqueRemainingKey set to traverse each necessary node only once.
        if uniqueRemainingKey.count >= 1 {
            for char in uniqueRemainingKey {
                if node.child[char] != nil {
                    let results = findAnagramsOf(remainingKey, node: node.child[char]!) as [String : Int]
                    wordList.merge(results)
                }
            }
        }
        
        return wordList
    }

    // MARK: Word Value
    
    let letterValue = [
        "a" : 1,
        "b" : 3,
        "c" : 3,
        "d" : 2,
        "e" : 1,
        "f" : 4,
        "g" : 2,
        "h" : 4,
        "i" : 1,
        "j" : 8,
        "k" : 5,
        "l" : 1,
        "m" : 3,
        "n" : 1,
        "o" : 1,
        "p" : 3,
        "q" : 10,
        "r" : 1,
        "s" : 1,
        "t" : 1,
        "u" : 1,
        "v" : 4,
        "w" : 4,
        "x" : 8,
        "y" : 4,
        "z" : 10
    ]

}
