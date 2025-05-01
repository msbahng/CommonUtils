//
//  BaseModel.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/27.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
@MainActor
@Observable open class BaseModel: NSObject, ErrorHandleProtocol, LoadingDisplayProtocol {
    
    public var isLoading: Bool = false
    public var error: Error?
    public var lastFetchTime = Date.distantPast
    
    public override init() {
        
    }
}

@available(iOS 17.0, *)
extension BaseModel {
    public var errorBinding: Binding<Error?> {
        Binding(
            get: { self.error },
            set: { self.error = $0 }
        )
    }
    
    public var isLoadingBinding: Binding<Bool> {
        Binding(
            get: { self.isLoading },
            set: { self.isLoading = $0 }
        )
    }
}
