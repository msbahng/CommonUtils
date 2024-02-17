//
//  ObjectUserDefaultsStorage.swift
//
//
//  Created by 方 茂碩（Mooseok Bahng） on 2023/11/08.
//

import Foundation

@propertyWrapper
public class ObjectArrayUserDefaultsStorage<T: Codable> {

    private let key: String

    public init(key: String) {
        self.key = key
    }

    public var wrappedValue: [T] {
        get {
            if let objects = UserDefaults.standard.value(forKey: key) as? Data {
                let decoder = JSONDecoder()
                if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [T] {
                    return objectsDecoded
                } else {
                    return []
                }
            } else {
                return []
            }
            
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue){
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
}
