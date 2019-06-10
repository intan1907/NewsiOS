//
//  GITSApps.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/15/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation


public struct GITSApps{
    static let GITSConfigBundle = [
       "base_url" :""
    ]
    
    public static func GetConfig() -> Dictionary<String, Any>? {
        var myDict: Dictionary<String, Any>?
        if let path = Bundle.main.path(forResource: "KMConfig", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            myDict = dict
//            let d = NSDictionary(
        }
        
        if let url = Bundle.main.url(forResource: "KMConfig", withExtension: "plist")
        {
            let d = NSDictionary(contentsOf: url)
            debugPrint(url)
            debugPrint(d)
        } else {
            debugPrint("No url")
        }
        
        if let fileUrl = Bundle.main.url(forResource: "KMConfig", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] { // [String: Any] which ever it is
                print(result)
            }
        }
        return myDict
    }
    
    public static func GetUrl() -> String{
        if let config = GetConfig() {
            if config["is_prod"] as! Bool {
                return config["base_url"] as! String
            } else {
                return config["dev_base_url"] as! String
            }
        }
        return ""
    }
    
    public static func GetUrlImage() -> String{
        if let config = GetConfig() {
            if config["is_prod"] as! Bool {
                return config["image_url"] as! String
            } else {
                return config["dev_image_url"] as! String
            }
        }
        return ""
    }
    
    public static func getApiKey() -> String{
        if let config = GetConfig() {
            return config["api_key"] as! String
        }
        return ""
    }
    
    public static func getAccessToken() -> String {
        if let config = GetConfig() {
            return config["access_token"] as! String
        }
        return ""
    }
    
    public static func getPrismMerchantDev() -> String {
        if let config = GetConfig() {
            if getIsProd() {
                return config["prism_merchant"] as! String
            } else {
                return config["dev_prism_merchant"] as! String
            }
        }
        return ""
    }
    
    public static func getIsProd() -> Bool {
        if let config = GetConfig() {
            return config["is_prod"] as! Bool
        }
        return false
    }
    
    
    public static func getGoogleApiKey() -> String{
        if let config = GetConfig() {
            return config["google_api_key"] as! String
        }
        return ""
    }
}
