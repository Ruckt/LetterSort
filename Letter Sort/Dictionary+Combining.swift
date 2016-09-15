//
//  Dictionary+Combining.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 7/24/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

extension Dictionary {
    mutating func merge<K, V>(_ dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}

extension Dictionary where Value: Comparable {
    var valueKeySorted: [(Key, Value)] {
        return sorted{ $0.1 > $1.1 }.sorted{ String(describing: $0.0) < String(describing: $1.0) }
    }

}
