//
//  ContentView.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/01/25.
//

import SwiftUI
import SwiftUiUtils

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(NavigationItem.allCases, id:\.self) { item in
                        NavigationLink(value: item) {
                            Text(item.title)
                        }
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

enum NavigationItem: CaseIterable {
    case simpleCell
    case flowStack
    case buttonStyles
    case viewExtension
    case shapeStyle
    case textEditor
    case textField
    case buttonExtension
    case forceUpdate
    case maintenance
    case toast
    
    var title: String {
        switch self {
        case .simpleCell:
            "SimpleCell"
        case .flowStack:
            "FlowStack"
        case .buttonStyles:
            "ButtonStyles"
        case .viewExtension:
            "View+Extension"
        case .shapeStyle:
            "ShapeStyle"
        case .textEditor:
            "TextEditor+Extension"
        case .textField:
            "TextField+Extension"
        case .buttonExtension:
            "Button+Extension"
        case .forceUpdate:
            "ForceUpdate"
        case .maintenance:
            "Maintenance"
        case .toast:
            "Toast"
        }
    }
}

@ViewBuilder
private func navigate(_ item: NavigationItem) -> some View {
    switch item {
    case .simpleCell:
        SimpleCellView()
    case .flowStack:
        FlowStackView()
    case .buttonStyles:
        ButtonStylesView()
    case .viewExtension:
        ViewExtensionView()
    case .shapeStyle:
        ShapeStyleView()
    case .textEditor:
        TextEditorExtensionView()
    case .textField:
        TextFieldExtensionView()
    case .buttonExtension:
        ButtonExtensionView()
    case .forceUpdate:
        ForceUpdateView(
            appstoreUrl: URL(string: "https://apps.apple.com/us/app/tokyo-b-class-gourmet/id6477338563")!
        )
    case .maintenance:
        MaintenanceView()
    case .toast:
        ToastView()
    }
}

#Preview {
    ContentView()
}
