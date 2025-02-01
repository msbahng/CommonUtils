//
//  ButtonExtensionView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct ButtonExtensionView: View {
    var body: some View {
        Form {
            Button("Full Width Button") {
            }
            .fullWidthButtonStyle()
                        
            Spacer()
        }
        .formStyle(.columns)
    }
}

#Preview {
    ButtonExtensionView()
}
