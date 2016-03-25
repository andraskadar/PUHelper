//
//  DictionaryExtensions.swift
//  Pods
//
//  Created by Andras on 25/03/16.
//
//

// MARK: - Map Dictionary type
//  http://stackoverflow.com/questions/24116271/whats-the-cleanest-way-of-applying-map-to-a-dictionary-in-swift/24219069#24219069
public extension Dictionary {
    
    public init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
    
    func mapPairs<OutKey: Hashable, OutValue>(@noescape transform: Element throws -> (OutKey, OutValue)) rethrows -> [OutKey: OutValue] {
        return Dictionary<OutKey, OutValue>(try map(transform))
    }
    
    func filterPairs(@noescape includeElement: Element throws -> Bool) rethrows -> [Key: Value] {
        return Dictionary(try filter(includeElement))
    }
    
    /**
     Map only the dictionary's value.
     
     - parameter transform: Transformation block.
     
     - throws: Exception may happen during conversion.
     
     - returns: The mapped dictionary.
     */
    public func map<OutValue>(@noescape transform: Value throws -> OutValue) rethrows -> [Key: OutValue] {
        return Dictionary<Key, OutValue>(try map { (k, v) in (k, try transform(v)) })
    }
    
}