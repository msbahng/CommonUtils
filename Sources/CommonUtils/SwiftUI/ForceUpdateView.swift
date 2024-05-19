//
//  ForceUpdateView.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/09.
//

import SwiftUI

public struct ForceUpdateView: View {
    
    let appstoreUrl: URL
    
    public init(appstoreUrl: URL) {
        self.appstoreUrl = appstoreUrl
    }
    
    public var body: some View {
        VStack(spacing: 40) {
            Spacer()
            if let icon = Bundle.main.icon {
                Image(uiImage: icon)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            }
            Text(String(localized: "update_needed_title", bundle: .module))
                .largeTitle()
                .multilineTextAlignment(.center)
            Text(String(localized: "update_needed_description", bundle: .module))
                .largeDescription()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.secondary)
            Button(action: {
                UIApplication.shared.open(appstoreUrl, options: .init(), completionHandler: nil)
            }, label: {
                Text(String(localized: "update_needed_description_update_now_button_for_ios", bundle: .module))
            })
            Spacer()
        }
    }
}

#Preview {
    ForceUpdateView(appstoreUrl: URL(string: "https://google.com")!)
}
