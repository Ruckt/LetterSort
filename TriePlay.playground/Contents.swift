//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class TrieNode {
    var letter:Character
    var fullWord:Bool
    var child = [Character:TrieNode]()
    
    init (letter1:Character, fullWord2:Bool) {
        letter = letter1
        fullWord = fullWord2
    }
}

class Trie {
    var root:TrieNode = TrieNode(letter1: "\0", fullWord2: false)
    
    func insertWord(word:String) {
        let wordLength = word.characters.count - 1
        var currentNode:TrieNode? = root
        var letterCounter = 0

        
        for letter in word.characters {
            let fulllWord = letterCounter == wordLength ? true : false
            letterCounter = letterCounter + 1
            print(letter)
            
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
            
            print(character)
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

// For some Playground fun!

var trie:Trie = Trie()
trie.insertWord("nicolas")
trie.insertWord("nighthawk")
print("--------------------")
trie.find("nicolas")
trie.find("nighthawk")
