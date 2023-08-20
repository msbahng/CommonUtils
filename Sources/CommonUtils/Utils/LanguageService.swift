//
//  Language.swift
//  
//
//  Created by Mooseok Bahng on 2023/08/08.
//

import Foundation
import NaturalLanguage

public enum LanguageService: String, Codable, CaseIterable, Identifiable {
    case english = "en"
    case japanese = "ja"
    case korean = "ko"
    case none
    
    public var id: Self {
        return self
    }
    
    public var localized: String {
        guard let localizedLanguage
                = Locale.current.localizedString(forIdentifier: self.rawValue)
        else {
            return "none"
        }
        
        return localizedLanguage
    }
    
    public static func identifySupportedLanguage(for string: String) -> LanguageService {
        let languageCode = identifyLanguage(for: string)
        return LanguageService(rawValue: languageCode) ?? .none
    }
    
    static func identifyLanguage(for string: String) -> String {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(string)
        
        guard let languageCode = recognizer.dominantLanguage?.rawValue else {
            return Locale.current.languageCode ?? "none"
        }
        
        return languageCode
    }
}

