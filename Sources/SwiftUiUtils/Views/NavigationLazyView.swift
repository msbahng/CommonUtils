//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/04.
//

import SwiftUI

public struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: Content {
        build()
    }
}
