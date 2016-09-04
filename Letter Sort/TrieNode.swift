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
        let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        let path = documentsPath?.stringByAppendingString("/Person")
        return path!
    }
    
    required init(coder aDecoder: NSCoder) {
        letter = aDecoder.decodeObjectForKey("letter") as! String
        leadingLetters = aDecoder.decodeObjectForKey("leadingLetters") as! String
        fullWord = aDecoder.decodeObjectForKey("fullWord") as! Bool
        child = aDecoder.decodeObjectForKey("child") as! [String:TrieNode]
        nodeValue = aDecoder.decodeObjectForKey("nodeValue") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(letter, forKey: "letter")
        aCoder.encodeObject(leadingLetters, forKey: "leadingLetters")
        aCoder.encodeObject(fullWord, forKey: "fullWord")
        aCoder.encodeObject(child, forKey: "child")
        aCoder.encodeObject(nodeValue, forKey: "nodeValue")
    }
    
    
    
}
