//
//  SimpleViews.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/25.
//

import SwiftUI
import SwiftUiUtils

struct SimpleCellView: View {
    
    var body: some View {
        Form {
            SimpleCell(title: "Cell Title 1")
            
            SimpleCell(title: "Cell Title w/o divider", showDivider: false)
            
            SimpleCell(title: "Cell Title 3") {
                Image(systemName: "house")
            }
            
            Spacer()
        }
        .formStyle(.columns)
    }
}

#Preview {
    SimpleCellView()
}
