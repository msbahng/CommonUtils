//
//  FlowStackView.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct FlowStackView: View {
    
    var body: some View {
        Form {
            FlowStack(horizontalSpacing: 10, verticalSpacing: 10) {
                Text("Item 1").padding(10).background(Color.gray)
                Text("Item 2 is long").padding(10).background(Color.green)
                Text("Item 3").padding(10).background(Color.yellow)
                Text("Item 4").padding(10).background(Color.blue)
                Text("Item 5").padding(10).background(Color.pink)
                Text("Item 6 is also long").padding(10).background(Color.brown)
            }
            .padding(10)
            
            Spacer()
        }
        .formStyle(.columns)
    }
}

#Preview {
    FlowStackView()
}
