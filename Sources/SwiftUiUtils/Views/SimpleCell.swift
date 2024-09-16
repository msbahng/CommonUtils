//
//  SimpleCell.swift
//
//
//  Created by Mooseok Bahng on 2024/05/12.
//

import SwiftUI

public struct SimpleCell<RightView: View>: View {
    
    private let title: String
    private let showDivider: Bool
    private let rightView: () -> RightView
    
    public init(
        title: String?,
        showDivider: Bool = true,
        @ViewBuilder rightView: @escaping () -> RightView = { EmptyView() }
    ) {
        self.title = title ?? ""
        self.showDivider = showDivider
        self.rightView = rightView
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                
                Spacer()
                
                rightView()
            }
            .padding(10)
            
            if showDivider {
                Divider()
            }
        }
    }
}

#Preview {
    SimpleCell(
        title: "This is title"
    ) {
        Text("test_text")
    }
}
