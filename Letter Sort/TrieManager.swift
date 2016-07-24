//
//  TrieManager.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation

class TrieManager {
    var root:TrieNode = TrieNode(letter: "\0", leadingLetters:"", fullWord: false)
    
    func insertWord(word:String) {
        let wordLength = word.characters.count - 1
        var currentNode:TrieNode? = root
        var letterCounter = 0
        
        for letter in word.characters {
            let fulllWord = letterCounter == wordLength ? true : false
            letterCounter = letterCounter + 1
            let leadingLetters = (currentNode?.leadingLetters)! + String(letter)
            
            if currentNode!.child[letter] == nil {
                currentNode!.child[letter] = TrieNode(letter: letter, leadingLetters: leadingLetters, fullWord: fulllWord)
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
    
    func findAnagramsOf(key:String, node:TrieNode) -> [String] {
       // print("Node: \(node.letter)")
        let keyLength = key.characters.count

        var wordList:[String] = []
        
        if node.fullWord {
           // print("Key: \(key)")
            //print("Leading letters: \(node.leadingLetters)")
            wordList.append(node.leadingLetters)
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
                    let results = findAnagramsOf(remainingKey, node: node.child[char]!) as [String]
                    wordList.appendContentsOf(results)
                }
            }
        }
        
        return wordList
    }
    
}
