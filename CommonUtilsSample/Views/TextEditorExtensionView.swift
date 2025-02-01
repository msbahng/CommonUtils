//
//  TextEditorExtensionView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct TextEditorExtensionView: View {
    @State var value: String = "text editor test"
    
    var body: some View {
        Form {
            Section {
                TextEditor(text: $value)
                    .textEditorStyle(minHeight: 40, height: nil)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } header: {
                Text("TextEditor")
            }
            .textCase(nil)
        }
    }
}

#Preview {
    TextEditorExtensionView()
}
