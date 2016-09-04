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
            
            if currentNode!.child[String(letter)] == nil {
                currentNode!.child[String(letter)] = TrieNode(letter: letter, leadingLetters: leadingLetters, nodeValue: nodeValue, fullWord: fulllWord)
            }
            
            currentNode = currentNode!.child[String(letter)]
        }
    }
    
    func crawlTheTrie(node: TrieNode) -> [String] {
        
        let nodeString = node.leadingLetters + node.letter
        var nodeList:[String] = [nodeString]

        if node.child.count == 0 {
            return nodeList
        } else {
            for child in node.child.values {
                
                let list = crawlTheTrie(child)
                nodeList += list
            }
        }
        return nodeList
    }
    
    func find(key:String) {
        let keyLength = key.characters.count
        
        var currentNode:TrieNode? = root
        var characterCount = 0
        
        for character in key.characters {
            currentNode = currentNode!.child[String(character)]
            
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
    
    func findAnagramsOf(key:String, node:TrieNode) -> [String : Int] {
        print("Child of \(key): \(node.child)")
        let keyLength = key.characters.count

        var wordList:[String : Int] = [:]
        
        if node.fullWord {
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
        
        for character in key.characters {
            if character == Character(node.letter) && !found {
                found = true
            } else {
                remainingKey = remainingKey + String(character)
                uniqueRemainingKey.insert(character)
            }
        }

        // Use uniqueRemainingKey set to traverse each necessary node only once.
        if uniqueRemainingKey.count >= 1 {
            for character in uniqueRemainingKey {
                if node.child[String(character)] != nil {
                    let results = findAnagramsOf(remainingKey, node: node.child[String(character)]!) as [String : Int]
                    wordList.merge(results)
                }
            }
        }
        return wordList
    }
    
    
    // MARK: Writing to file
    
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
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
