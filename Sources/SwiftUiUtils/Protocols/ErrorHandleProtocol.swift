//
//  ErrorHandleProtocol.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/27.
//

import Foundation

@MainActor
protocol ErrorHandleProtocol: AnyObject {
    
    var error: Error? { get set }
    func clearError()
}

extension ErrorHandleProtocol {
    
    func clearError() {
        error = nil
    }
}
