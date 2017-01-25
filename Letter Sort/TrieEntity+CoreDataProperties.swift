//
//  TrieEntity+CoreDataProperties.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 9/21/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

import Foundation
import CoreData


extension TrieEntity {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<TrieEntity> {
        return NSFetchRequest<TrieEntity>(entityName: "TrieEntity");
    }

    @NSManaged public var fullWord: Bool
    @NSManaged public var leadingLetters: String
    @NSManaged public var letter: String
    @NSManaged public var nodeValue: NSNumber
    @NSManaged public var child: Data

}
