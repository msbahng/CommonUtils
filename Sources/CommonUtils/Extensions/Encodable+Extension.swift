//
//  Encodable+Extension.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/28.
//

import Foundation

extension Encodable {
    
    public func encode() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw NSError()
        }
        
        return dictionary
    }
}
