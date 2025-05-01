//
//  LoadingDisplayProtocol.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/27.
//

import Foundation

@MainActor
protocol LoadingDisplayProtocol {
    
    var isLoading: Bool { get set }
}
