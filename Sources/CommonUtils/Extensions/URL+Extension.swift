//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/23.
//

import Foundation

extension URL {
    var createdDate: Date? {
        let _ = self.startAccessingSecurityScopedResource()
        
        do {
            let attributes = try FileManager.default.attributesOfItem(atPath: self.path)
            let creationDate = attributes[.creationDate] as? Date ?? Date()
            defer {
                self.stopAccessingSecurityScopedResource()
            }
            return creationDate
        } catch {
            return nil
        }
    }
}
