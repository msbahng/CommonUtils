
import Foundation

public class ErrorReporter: ErrorReportable {

    /** Subscribe to this to get notifcations of errors. */
    @Published public private(set) var errors: [ReportableError] = []

    nonisolated(unsafe) public static let shared = ErrorReporter()

    /** Will publish the error to observers. */
    public func report(error: ReportableError) {
        self.errors = [error]
    }
}
