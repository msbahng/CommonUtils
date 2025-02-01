//
//  TextFieldExtensionView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct TextFieldExtensionView: View {
    @State var value: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("placeholder", text: $value)
                    .textFieldStyle()
                    .frame(maxWidth: .infinity, alignment: .leading)
            } header: {
                Text("TextField")
            }
            .textCase(nil)
        }
    }
}

#Preview {
    TextFieldExtensionView()
}
