import Foundation

public protocol DebugLogRecorderDelegate: AnyObject {
    func updateLogState()
}

public class DebugLogRecorder {

    nonisolated(unsafe) private(set) public static var shared = DebugLogRecorder()

    public enum LogType {
        case plane
        case filter
        case track
        case unique
    }

    public weak var delegate: DebugLogRecorderDelegate?
    public var isTrack = false {
        didSet {
            self.isTrack ? () : (self.trackedLogs = self.logs)
        }
    }

    private var logs: [String] = []
    private var filteredLogs: [String] = []
    private var trackedLogs: [String] = []
    /**
     Prepared uniqueLogs to pass to DEBUG_LogsDetailViewController
     */
    private var uniqueLogs: [String] = []

    private init() {}

    public func clearLogs() {
        self.logs = []
        self.filteredLogs = []
        self.trackedLogs = []
        self.uniqueLogs = []
    }

    public func insertPlaneLogs(_ data: String) {
        self.logs.append(data)
        self.uniqueLogs.append(data)
        self.delegate?.updateLogState()
    }

    public func initializeUniqueLogs(type: LogType) {
        switch type {
            case .plane:
                self.uniqueLogs = self.logs

            case .track:
                self.uniqueLogs = self.trackedLogs

            default:
                break
        }
    }

    public func insertLogsToFilterdLogs(type: LogType, text: String) {
        switch type {
            case .plane:
                self.filteredLogs = self.logs
                    .filter { $0.matching(caseInsensitive: text) }
                self.uniqueLogs = self.filteredLogs

            case .track:
                self.filteredLogs = self.trackedLogs
                    .filter { $0.matching(caseInsensitive: text) }
                self.uniqueLogs = self.filteredLogs

            default:
                break
        }
    }

    public func getLogs(type: LogType) -> [String] {
        switch type {
            case .plane:
                return self.logs

            case .filter:
                return self.filteredLogs

            case .track:
                return self.trackedLogs

            case .unique:
                return self.uniqueLogs
        }
    }
}

private extension String {
    /** Match a string based on regular expression pattern. */
    func matching(
        patterns: [String],
        options: NSRegularExpression.Options = []
    )
        -> Bool {

        let length = self.count
        var regularExpression: NSRegularExpression
        let fullRange = NSRange(location: 0, length: length)

        for pattern in patterns {
            do {
                regularExpression = try NSRegularExpression(
                    pattern: pattern,
                    options: options
                )
            } catch {
                #if DEBUG
                print(String(describing: error))
                #endif
                continue
            }

            let firstMatch = regularExpression.firstMatch(
                in: self,
                options: [],
                range: fullRange
            )
            if firstMatch != nil {
                return true
            }
        }

        return false
    }

    func matching(
        pattern: String,
        options: NSRegularExpression.Options = []
    )
        -> Bool {
        self.matching(patterns: [pattern], options: options)
    }

    /** Convenience for matching case insensitively */
    func matching(caseInsensitive string: String) -> Bool {
        self.matching(pattern: string, options: [.caseInsensitive])
    }
}
