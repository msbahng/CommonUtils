//
//  FileUtil.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit

public class FileUtil {
    
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    public static func getTempImageDirectory() -> URL? {
        Self.getFileDirectory(".imageTemp")
    }
    
    public static func getfileCacheDirectory() -> URL? {
        Self.getFileDirectory(".fileCache")
    }
    
    public static func getFileDirectory(_ pathComponent: String) -> URL? {
        let directory = getDocumentsDirectory().appendingPathComponent(pathComponent, isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: directory.path) {
            do {
                try FileManager.default.createDirectory(atPath: directory.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                return nil
            }
        }
        
        return directory
    }
    
    public static func clearImageDirectory() {
        guard let directory = getTempImageDirectory() else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: directory.path)
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }
    
    public static func saveAsPng(image: UIImage, fileName: String) -> URL? {
        guard
            let data = image.pngData(),
            let filename = getTempImageDirectory()?.appendingPathComponent(fileName)
        else {
            return nil
        }
        
        do {
            try data.write(to: filename)
        } catch {
            return nil
        }
        
        return filename
    }
}
