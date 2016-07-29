//
//  TrieEntity.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 7/20/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation
import CoreData


class TrieEntity: NSManagedObject {

    @NSManaged var fullWord: NSNumber?
    @NSManaged var leadingLetters: String?
    @NSManaged var letter: String?
    @NSManaged var child: NSData?
}
