public protocol Loggable {
    
    func printLog(
        _ objects: Any...,
        sender: Any?,
        identifier: CustomStringConvertible?,
        function: String
    )

    func printLog(
        _ object: Any,
        sender: Any?,
        identifier: CustomStringConvertible?,
        function: String
    )

    func printDebugLog(
        _ objects: Any...,
        sender: Any?,
        identifier: CustomStringConvertible?,
        function: String
    )

    func printDebugLog(
        _ object: Any,
        sender: Any?,
        identifier: CustomStringConvertible?,
        function: String
    )
}

public extension Loggable {
    func printLog(
        _ objects: Any...,
        sender: Any? = nil,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(objects)",
            isDebug: false,
            sender: sender ?? self,
            identifier: identifier,
            function: function
        )
    }

    func printLog(
        _ object: Any,
        sender: Any? = nil,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(object)",
            isDebug: false,
            sender: sender ?? self,
            identifier: identifier,
            function: function
        )
    }

    func printDebugLog(
        _ objects: Any...,
        sender: Any? = nil,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(objects)",
            isDebug: true,
            sender: sender ?? self,
            identifier: identifier,
            function: function
        )
    }

    func printDebugLog(
        _ object: Any,
        sender: Any? = nil,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(object)",
            isDebug: true,
            sender: sender ?? self,
            identifier: identifier,
            function: function
        )
    }
}

#if canImport(Foundation)
import Foundation
extension NSObject: Loggable {}
#endif

private typealias AnyOptional = Any?
extension AnyOptional: Loggable {}
