//
//  CentralViewController.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 4/30/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import UIKit


class CentralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var letterInputTextField: UITextField!
    @IBOutlet var wordListTableView: UITableView!
    let textCellIdentifier = "TextCell"
    
    var trie: TrieManager!
    var anagrams : [String] = []
    var givenColor: UIColor?
    var isTrieMade = false
    
    override func viewDidLoad() {
        print("view controller")
        super.viewDidLoad()
        wordListTableView.delegate = self
        wordListTableView.dataSource = self
        wordListTableView.separatorStyle = .None
        letterInputTextField.delegate = self

        givenColor = titleLabel.textColor
        titleLabel.textColor = UIColor.redColor()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

    //        var word = "sophie"
//        print("Finding Anagrams of \(word):")
//        var anagrams = trie.findAnagramsOf(word, node: trie.root)
//        print(anagrams)
//  
//        word = "CurlyDay"
//        print("Finding Anagrams of \(word):")
//        anagrams = trie.findAnagramsOf(word, node: trie.root)
//        print(anagrams)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func runFindAnagramFor(word: String) {
        print("Finding Anagrams of \(word):")
        anagrams = trie.findAnagramsOf(word, node: trie.root)
        print(anagrams)
        wordListTableView.reloadData()
    }
    

    // MARK: Table View Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        [self refreshScreen];
        return anagrams.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        cell.selectionStyle = .None;
        cell.textLabel!.textColor = givenColor
        cell.textLabel!.textAlignment = .Center
        cell.textLabel!.text = anagrams[row]
        
        return cell
    }
    
    // MARK: UITextFieldDelegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let letters = letterInputTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        print(letters!)
        letterInputTextField.resignFirstResponder()
        
        if isTrieMade {
            runFindAnagramFor(letters!)
        } else {
            print("Trie not yet ready")
        }
        
        return true
    }


}

