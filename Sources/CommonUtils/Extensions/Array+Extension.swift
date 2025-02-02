//
//  File.swift
//  
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/01/16.
//

import Foundation

public protocol Reorderable {
    associatedtype OrderElement: Equatable
    var orderElement: OrderElement { get }
}

public extension Array where Element: Reorderable {

    public func reorder(by preferredOrder: [Element.OrderElement]) -> [Element] {
        sorted {
            guard let first = preferredOrder.firstIndex(of: $0.orderElement) else {
                return false
            }

            guard let second = preferredOrder.firstIndex(of: $1.orderElement) else {
                return true
            }

            return first < second
        }
    }
}

public extension Array {
    func any(at position: Int) -> Element? {
        if position < self.startIndex || position >= self.endIndex {
            return nil
        }
        return self[position]
    }

    func any(at position: Int?) -> Element? {
        if let position = position {
            return self.any(at: position)
        }
        return nil
    }

    func any(at indexes: [Index]) -> [Element] {

        let elements: [Element] = indexes.enumerated().compactMap {
            self.any(at: $1)
        }

        return elements
    }

    func any(at indexes: Index...) -> [Element] {
        self.any(at: indexes)
    }

    func any(in range: Range<Index>) -> [Element] {

        let indexes: [Index] = range.map { index in
            index
        }

        let elements = self.any(at: indexes)
        return elements
    }
}

public extension Array {
    func rotate(startIndex: Int) -> Array? {
        guard startIndex < self.count else { return nil }
        let sliceBefore = self.prefix(upTo: startIndex)
        let sliceAfter = self.suffix(from: startIndex)
        return Array(sliceAfter + sliceBefore)
    }

    mutating func replace(at position: Int, newValue: Element) {
        if position < self.startIndex || position >= self.endIndex {
            return
        }
        self[position] = newValue
    }

    mutating func replace(
        at position: Int,
        handler: (inout Element) -> Element
    ) {
        if position < self.startIndex || position >= self.endIndex {
            return
        }
        self[position] = handler(&self[position])
    }

    func insert(separator: Element) -> [Element] {
        var list: [Element] = []
        for (index, element) in self.enumerated() {
            if index > 0 {
                list.append(separator)
            }
            list.append(element)
        }
        return list
    }
}

public extension Array where Element: Equatable {
    func unique() -> [Element] {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }

    func unique(_ equalBlock: (_ target: Element, _ source: Element) -> Bool) -> [Element] {
        self.reduce([]) { result, value in
            result.contains(where: { equalBlock($0, value) })
                ? result
                : result + [value]
        }
    }
}

public extension Array where Element == URLQueryItem {
    subscript(_ key: String) -> URLQueryItem? {
        self.first(where: { $0.name == key })
    }
}

public extension Array where Element == NSAttributedString {
    func joinAttributedString(separator: NSAttributedString)
        -> NSAttributedString {
        let concatAttributedString = NSMutableAttributedString()
        for (index, element) in self.enumerated() {
            if index > 0 {
                concatAttributedString.append(separator)
            }
            concatAttributedString.append(element)
        }
        return concatAttributedString
    }
}

public extension Array {
    ///Access to underlying array through keypath.
    var array: Self {
        self
    }
}
