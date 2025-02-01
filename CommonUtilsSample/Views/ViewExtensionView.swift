//
//  ViewExtensionView.swift
//  CommonUtilsSample
//
//  Created by Mooseok Bahng on 2025/01/26.
//

import SwiftUI
import SwiftUiUtils

struct ViewExtensionView: View {
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("redacted title")
                    Text("redacted description")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .redacted(showPlaceholder: true)
            } header: {
                Text("redacted")
            }
            .textCase(nil)
            
            Section {
                Text("Hidden")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .isHidden(true)
                
                Text("Shown")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .isHidden(false)
            } header: {
                Text("isHidden")
            }
            .textCase(nil)
        }
    }
}

#Preview {
    ViewExtensionView()
}
