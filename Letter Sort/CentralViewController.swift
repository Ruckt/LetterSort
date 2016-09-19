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
    var anagrams : [String : Int] = [:]
    var anagramsArray : [String] = []
    var givenColor: UIColor?
    var isTrieMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordListTableView.delegate = self
        wordListTableView.dataSource = self
        wordListTableView.separatorStyle = .none
        letterInputTextField.delegate = self

        givenColor = titleLabel.textColor
        titleLabel.textColor = UIColor.red

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func runFindAnagramFor(_ word: String) {
        print("Finding Anagrams of \(word):")
        anagrams = trie.findAnagramsOf(word, node: trie.root)
        
        let anagramsSorted = anagrams.valueKeySorted
        anagramsArray.removeAll()

        for (word, value) in anagramsSorted {
            anagramsArray.append(word)
        }
        
        wordListTableView.reloadData()
    }
    

    // MARK: Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anagrams.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        let row = (indexPath as NSIndexPath).row
        cell.selectionStyle = .none;
        cell.textLabel!.textColor = givenColor
        cell.textLabel!.textAlignment = .center
        cell.textLabel!.text = anagramsArray[row]
        
        return cell
    }
    
    // MARK: UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let letters = letterInputTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
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
