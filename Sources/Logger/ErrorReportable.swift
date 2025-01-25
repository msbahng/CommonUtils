
import Foundation

public protocol ErrorReportable {
    typealias ReportableError = Error & CustomStringConvertible
    func report(error: ReportableError)
}
