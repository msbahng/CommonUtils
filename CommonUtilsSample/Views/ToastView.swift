//
//  ToastView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/02/01.
//

import SwiftUI
import SwiftUiUtils

struct ToastView: View {
    @State private var showDefault: Bool = false
    @State private var showCustom: Bool = false
    
    var body: some View {
        Form {
            Spacer()
                .frame(height: 50)
            
            Button("Default Toast") {
                showDefault = true
            }
            .padding(10)
            
            Button("Custom Color Toast") {
                showCustom = true
            }
            .padding(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .formStyle(.columns)
        .toast("Default Toast", isShowToast: $showDefault)
        .toast("Custom Color Toast", backgroundColor: Color.red, titleColor: Color.white, isShowToast: $showCustom)
    }
}

#Preview {
    ToastView()
}
