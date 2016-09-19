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
    
    func archiveOne(_ nodes: [TrieNode]) {
        
        let path = getDocumentsDirectoryURL()?.appendingPathComponent(uniqueFileName)
        let pathString = path!.absoluteString.trimmingCharacters(in: CharacterSet(charactersIn: "file://"))

        let data = NSKeyedArchiver.archivedData(withRootObject: nodes)
        
        
        try? data.write(to: URL(fileURLWithPath: pathString), options: [.atomic])

    }
    
    func unArchiveTrie() -> [TrieNode]? {
        
        let fileManager = FileManager()
        
        let path = getDocumentsDirectoryURL()?.appendingPathComponent(uniqueFileName)
        let pathString = path!.absoluteString.trimmingCharacters(in: CharacterSet(charactersIn: "file://"))
        print("Path: \(pathString)")
        
        if fileManager.fileExists(atPath: pathString) {
            
            let nodes = NSKeyedUnarchiver.unarchiveObject(withFile: pathString) as! [TrieNode]
            return nodes
        }
        
        return nil
    }
    
    func getDocumentsDirectoryURL() -> URL? {
        let fileManager = FileManager()
        if let docsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            return docsDirectory
        }
        return nil
    }

}
