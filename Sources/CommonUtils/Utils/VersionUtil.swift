import Foundation

public class VersionUtil {
    
    public static func getVersionText() -> String {
        
        guard
            let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String,
            let bundleVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        else {
            return ""
        }
        
        return String(format: "%@ (%@)", version, bundleVersion)
    }
}
