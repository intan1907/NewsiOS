//
//  StringHelper.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 11/24/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation

public class GITSStringHelper {
    
    public static func generateDeviceID()->String{
        //device id
        let deviceid = UIDevice.current.identifierForVendor?.uuidString
        return deviceid!
    }
    
    public static func isEmptyString(text: String)-> Bool {
        var status = true
        trimCharEmpty(text: text) { (trim) in
            let result = trim.components(separatedBy: " ")
            if result.count > 0 {
                for word in result {
                    if word.isEmpty {
                        status = false
                    }
                    if word != "" {
                        status = true
                    }
                }
            } else {
                status = false
            }
        }
        return status
    }
    
    public static func trimCharEmpty(text: String, onSuccess: @escaping (_ result: String)-> Void) {
        if text.first == " " {
            var truncated = text
            truncated.removeFirst()
            self.trimCharEmpty(text: truncated, onSuccess: onSuccess)
        } else if text.last == " " {
            var truncated = text
            truncated.removeLast()
            self.trimCharEmpty(text: truncated, onSuccess: onSuccess)
        } else {
            onSuccess(text)
        }
    }
    
    public static func isValidEmail(text:String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) != nil
    }
    
    public static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phoneNumber.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  phoneNumber == filtered
    }
    
    public static func isOnlyNumber(text: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return text.rangeOfCharacter(from: invalidCharacters) == nil
    }
    
    public static func isValidPassword(text: String) -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,12}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: text)
    }
    
    public static func isValidNumeric(value: String, min: Int, max: Int) -> Bool {
        let REGEX = "^[0-9]{\(min),\(max)}$"
        let matches = NSPredicate(format: "SELF MATCHES %@", REGEX)
        let result =  matches.evaluate(with: value)
        return result
    }
    
    public static func localized(key: String, bundle: Bundle) -> String {
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

extension String {
    
    public var localized: String {
        if GITSPref.getString(key: GITSPref.KEY_LANGUAGE) == "" {
            // we set a default, just in case
            GITSPref.saveString(key: GITSPref.KEY_LANGUAGE, value: "id")
        }
        else {}
        
        let lang = GITSPref.getString(key: GITSPref.KEY_LANGUAGE)
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path ?? "")
        return NSLocalizedString(self, tableName: nil, bundle: bundle ?? Bundle(), value: "", comment: "")
    }
    
    public func htmlLinkDetector() -> String {
        var resultText = self
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        
        for match in matches {
            guard let range = Range(match.range, in: self) else { continue }
            let url = self[range]
            resultText = resultText.replacingOccurrences(of: url, with: "<a href=\"\(url)\">\(url)</a>", options: .literal, range: nil)
        }
        return resultText
    }
    
    public func validateUrl() -> String {
        if self.contains("http://") || self.contains("https://") {
            return self
        } else {
            return "http://\(self)"
        }
    }
    
}
