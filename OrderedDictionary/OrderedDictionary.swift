//
//  OrderedDictionary.swift
//  CloudBike
//
//  Created by Le Tai on 9/26/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import Foundation

public struct OrderedDictionary<Tk: Hashable, Tv> {
    public var keys: Array<Tk> = []
    public var values: Dictionary<Tk,Tv> = [:]
    
    public var count: Int {
        assert(keys.count == values.count, "Keys and values array out of sync")
        return self.keys.count;
    }
    
    public init() {}
    
    public subscript(index: Int) -> Tv? {
        get {
            let key = self.keys[index]
            return self.values[key]
        }
        set(newValue) {
            let key = self.keys[index]
            if let newValue = newValue {
                self.values[key] = newValue
            } else {
                self.values.removeValueForKey(key)
                self.keys.removeAtIndex(index)
            }
        }
    }
    
    public subscript(key: Tk) -> Tv? {
        get {
            return self.values[key]
        }
        set(newValue) {
            if newValue == nil {
                self.values.removeValueForKey(key)
                self.keys = self.keys.filter {$0 != key}
            }
            
            let oldValue = self.values.updateValue(newValue!, forKey: key)
            if oldValue == nil {
                self.keys.append(key)
            }
        }
    }
    
    public var description: String {
        var result = "{\n"
        for var i = 0; i < self.count; i++ {
            result += "[\(i)]: \(self.keys[i]) => \(self[i])\n"
        }
        result += "}"
        return result
    }
}