//
//  PersistanceManager.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 9/4/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation


class PersistanceManager {
    
    //let uniqueFileName = NSUUID().UUIDString
    let uniqueFileName = "LetterSort"
    
    func archiveOne(nodes: [TrieNode]) {
        
        let path = getDocumentsDirectoryURL()?.URLByAppendingPathComponent(uniqueFileName)
        let pathString = path!.absoluteString.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "file://"))

        let data = NSKeyedArchiver.archivedDataWithRootObject(nodes)
        
        data.writeToFile(pathString, atomically: true)

    }
    
    func unArchiveTrie() -> [TrieNode]? {
        
        let fileManager = NSFileManager()
        
        let path = getDocumentsDirectoryURL()?.URLByAppendingPathComponent(uniqueFileName)
        let pathString = path!.absoluteString.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "file://"))
        print("Path: \(pathString)")
        
        if fileManager.fileExistsAtPath(pathString) {
            
            let nodes = NSKeyedUnarchiver.unarchiveObjectWithFile(pathString) as! [TrieNode]
            //print("Unarchiving: \(node.leadingLetters + node.letter)")
            return nodes
        }
        
        return nil
    }
    
    func getDocumentsDirectoryURL() -> NSURL? {
        let fileManager = NSFileManager()
        if let docsDirectory = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first {
            return docsDirectory
        }
        return nil
    }

}