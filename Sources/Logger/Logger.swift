import Foundation

#if canImport(DebugLogger)
import DebugLogger
#endif

public struct Logger {

    public static func printLog(
        _ objects: Any...,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(objects)",
            isDebug: false,
            sender: "",
            identifier: identifier,
            function: function
        )
    }

    public static func printLog(
        _ object: Any,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(object)",
            isDebug: false,
            sender: "",
            identifier: identifier,
            function: function
        )
    }

    public static func printDebugLog(
        _ objects: Any...,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(objects)",
            isDebug: true,
            sender: "",
            identifier: identifier,
            function: function
        )
    }

    public static func printDebugLog(
        _ object: Any,
        sender: Any,
        identifier: CustomStringConvertible? = nil,
        function: String = #function
    ) {
        Logger.print(
            "\(object)",
            isDebug: true,
            sender: sender,
            identifier: identifier,
            function: function
        )
    }

    internal static func print(
        _ stringObject: String,
        isDebug: Bool,
        sender: Any,
        identifier: CustomStringConvertible?,
        function: String,
        debugger: DebugLogRecorder? = DebugLogRecorder.shared
    ) {
        #if DEBUG_AVAILABLE
        let commonLogFormat = self.logFormat(
            sender: sender,
            identifier: identifier,
            function: function
        )
        if isDebug {
            Swift.debugPrint(stringObject, commonLogFormat)
        } else {
            Swift.print(stringObject, commonLogFormat)
            guard let debugger = debugger else {
                return
            }
            if debugger.isTrack {
                debugger.insertPlaneLogs("\(stringObject) \(commonLogFormat)")
            }
        }
        #endif
    }

    internal static func logFormat(
        sender: Any,
        identifier: CustomStringConvertible?,
        function: String
    ) -> String {
        "\(sender): \(identifier ?? ""): \(function): "
    }
}
