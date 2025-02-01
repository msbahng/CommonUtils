//
//  ButtonStylesView.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct ButtonStylesView: View {
    var body: some View {
        Form {
            Button("Bordered Button") {
            }
            .buttonStyle(BorderedButtonStyle())
                        
            Spacer()
        }
        .formStyle(.columns)
    }
}

#Preview {
    ButtonStylesView()
}
