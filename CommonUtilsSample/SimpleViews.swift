//
//  SimpleViews.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/25.
//

import SwiftUI
import SwiftUiUtils

struct SimpleViews: View {
    
    var body: some View {
        Form {
            Section {
                SimpleCell(title: "Cell Title 1")
                
                SimpleCell(title: "Cell Title w/o divider", showDivider: false)
                
                SimpleCell(title: "Cell Title 3") {
                    Image(systemName: "house")
                }
            } header: {
                Text("SimpleCell")
            }
            
            Section {
                FlowStack(horizontalSpacing: 10, verticalSpacing: 10) {
                    Text("Item 1").padding(10).background(Color.gray)
                    Text("Item 2 is long").padding(10).background(Color.green)
                    Text("Item 3").padding(10).background(Color.yellow)
                    Text("Item 4").padding(10).background(Color.blue)
                    Text("Item 5").padding(10).background(Color.pink)
                    Text("Item 6 is also long").padding(10).background(Color.brown)
                }
                .padding(10)
            } header: {
                Text("FlowStack")
            }
            
            Spacer()
        }
        .formStyle(.columns)
    }
}

#Preview {
    SimpleViews()
}
