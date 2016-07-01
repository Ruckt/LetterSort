//
//  CentralViewController.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import UIKit


class CentralViewController: UIViewController {

    var trie : TrieManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view controller")
    

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
//        trie.find("zebra")
//        trie.find("nighthawk")
//        trie.find("blank")
        trie.find("edan")
        
        let word = "edan"
        print("Finding Anagrams of \(word):")
        let anagrams = trie.findAnagramsOf(word, node: trie.root)
        print(anagrams)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

