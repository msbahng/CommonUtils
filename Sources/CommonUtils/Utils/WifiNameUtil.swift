//
//  WifiNameUtil.swift
//  
//
//  Created by Mooseok Bahng on 2023/08/20.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

public class WifiNameUtil {
    
    public static func getWiFiSsid() -> String? {
        var ssid: String?
        if  let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        
        return ssid
    }
}
