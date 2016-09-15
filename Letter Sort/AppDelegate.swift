//
//  AppDelegate.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var filePath : String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
        return url.appendingPathComponent("TrieData").path
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("HELLO LETTER SORT")
        
        
        let trie:TrieManager = TrieManager()
        let centralVC = self.window!.rootViewController as! CentralViewController
        centralVC.trie = trie
        
        
        if (true) {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async { [unowned self] in
                
                if let nodes = self.readFromFile() {
                    print("Un Archived: \(nodes.count)")
                    trie.root = nodes[0]
                    
                    centralVC.isTrieMade = true
                    centralVC.titleLabel.textColor = centralVC.givenColor
                }
            }
        } else {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async { [unowned self] in
                
                let wordList = self.uploadWordList()
                wordList.enumerateLines(invoking: { (line, stop) in
                    trie.insertWord(line)
                })
                
                print("Trie Made")
                centralVC.isTrieMade = true
                centralVC.titleLabel.textColor = centralVC.givenColor
                
                DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async { [unowned trie] in
                    let list = trie.crawlTheTrie(trie.root)
                    PersistanceManager().archiveOne(list)
                    // let alpha = list.sort { $0 < $1 }
                    
                    //Count = 589,315
                    print("Count: \(list.count)")
                }
            }
        }
        
        return true
    }
    
    func readFromFile() -> [TrieNode]? {
        return PersistanceManager().unArchiveTrie()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func uploadWordList() -> String {
        if let filepath = Bundle.main.path(forResource: "WordList", ofType: "txt") {
            do {
                let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                return contents
            } catch {
                // contents could not be loaded
                return ""
            }
        } else {
            // WordList.txt not found!
            return ""
        }
    }

}

