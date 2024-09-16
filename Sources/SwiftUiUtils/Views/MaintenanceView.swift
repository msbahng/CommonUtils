//
//  MaintenanceView.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/08.
//

import SwiftUI

public struct MaintenanceView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "wrench.and.screwdriver")
                .resizable()
                .frame(width: 80, height: 80)
            Text(String(localized: "maintenance_title", bundle: .module))
                .largeTitle()
                .multilineTextAlignment(.center)
            Text(String(localized: "maintenance_description", bundle: .module))
                .largeDescription()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.secondary)
            Spacer()
        }
    }
}

#Preview {
    MaintenanceView()
}
