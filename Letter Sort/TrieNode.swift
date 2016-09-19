//
//  TrieNode.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 6/4/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation

class TrieNode:  NSObject, NSCoding {
    var letter:String
    var fullWord:Bool
    var leadingLetters:String
    var child = [String:TrieNode]()
    var nodeValue:Int
    
    init (letter:Character, leadingLetters:String, nodeValue: Int, fullWord:Bool) {
        self.letter = String(letter)
        self.fullWord = fullWord
        self.nodeValue = nodeValue
        self.leadingLetters = leadingLetters
    }
    
    class func path() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let path = (documentsPath)! + "/Person"
        return path
    }
    
    required init(coder aDecoder: NSCoder) {
        letter = aDecoder.decodeObject(forKey: "letter") as? String ?? ""
        leadingLetters = aDecoder.decodeObject(forKey: "leadingLetters") as? String ?? ""
        fullWord = aDecoder.decodeBool(forKey: "fullWord")
        child = aDecoder.decodeObject(forKey: "child") as? [String:TrieNode] ?? [:]
        nodeValue = aDecoder.decodeObject(forKey: "nodeValue") as? Int ?? 0
   }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(letter, forKey: "letter")
        aCoder.encode(leadingLetters, forKey: "leadingLetters")
        aCoder.encode(fullWord, forKey: "fullWord")
        aCoder.encode(child, forKey: "child")
        aCoder.encode(nodeValue, forKey: "nodeValue")
    }
    
}
