//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2024/01/06.
//

import SwiftUI

/// Shortcut: Binding(get: .., set: ..) -> bind(.., ..)
func bind<T>(_ get: @escaping () -> (T), _ set: @escaping (T) -> () = {_ in}) -> Binding<T> {
    Binding(get: get, set: set)
}

/// Rebind a Binding<T?> as Binding<T> using a default value.
func bind<T>(_ boundOptional: Binding<Optional<T>>, `default`: T) -> Binding<T> {
    Binding(
        get: { boundOptional.wrappedValue ?? `default`},
        set: { boundOptional.wrappedValue = $0 }
    )
}

/// Example: `TextField("", text: $test ?? "default value")`
/// See https://stackoverflow.com/a/61002589/5970728
public func ??<T>(_ boundCollection: Binding<Optional<T>>, `default`: T) -> Binding<T> {
    bind(boundCollection, default: `default`)
}


// Allows use of optional binding where non-optional is expected.
// Example: `Text($myOptionalStringBinding)`
// From: https://stackoverflow.com/a/57041232/5970728
extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}
