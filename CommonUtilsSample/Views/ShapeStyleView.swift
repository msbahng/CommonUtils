//
//  ShapeStyleView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct ShapeStyleView: View {
    
    @State var titleId = UUID()
    @State var descriptionId = UUID()
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("title")
                        .padding()
                        .background(Color.random)
                        .id(titleId)
                    
                    Text("description")
                        .padding()
                        .background(Color.random)
                        .id(descriptionId)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button("Redraw") {
                    titleId = UUID()
                    descriptionId = UUID()
                }
                .frame(maxWidth: .infinity)
            } header: {
                Text("for debugging")
            }
            .textCase(nil)
        }
    }
}

#Preview {
    ShapeStyleView()
}
