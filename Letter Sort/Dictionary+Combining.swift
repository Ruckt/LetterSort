//
//  Dictionary+Combining.swift
//  Letter Sort
//
//  Created by Edan Lichtenstein on 7/24/16.
//  Copyright © 2016 Ruckt. All rights reserved.
//

extension Dictionary {
    mutating func merge<K, V>(dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}

extension Dictionary where Value: Comparable {
    var valueKeySorted: [(Key, Value)] {
        return sort{ $0.1 > $1.1 }.sort{ String($0.0) < String($1.0) }
    }

}