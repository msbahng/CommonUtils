//
//  ContentView.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink(value: NavigationItem.simpleViews) {
                        Text("Simple Views")
                    }
                } header: {
                    Text("SwiftUiUtils")
                }
                .textCase(nil)
            }
            .navigationDestination(for: NavigationItem.self) { item in
                navigate(item)
            }
        }
    }
}

enum NavigationItem {
    case simpleViews
}

@ViewBuilder
private func navigate(_ item: NavigationItem) -> some View {
    switch item {
    case .simpleViews:
        SimpleViews()
    }
}

#Preview {
    ContentView()
}
