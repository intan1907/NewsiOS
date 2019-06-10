//
//  JadwalModel.swift
//  GITSHome
//
//  Created by GITS INDONESIA on 27/02/18.
//  Copyright © 2018 GITS INDONESIA. All rights reserved.
//

import Foundation

public class JadwalModel: NSObject, NSCoding{
    public var name: String?
    public var time: String?
    public var date: String?
    public var imageBackground: String?
    public var isOn: Bool?
    public var praAdzan: Int?
    
    public init(name: String?, time: String?, date: String?, imageBackground: String?, isOn: Bool?, praAdzan: Int?){
        self.name = name
        self.time = time
        self.date = date
        self.imageBackground = imageBackground
        self.isOn = isOn
        self.praAdzan = praAdzan
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.time = aDecoder.decodeObject(forKey: "time") as? String
        self.date = aDecoder.decodeObject(forKey: "date") as? String
        self.imageBackground = aDecoder.decodeObject(forKey: "imageBackground") as? String
        self.isOn = aDecoder.decodeObject(forKey: "isOn") as? Bool
        self.praAdzan = aDecoder.decodeObject(forKey: "praAdzan") as? Int
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.time, forKey: "time")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.imageBackground, forKey: "imageBackground")
        aCoder.encode(self.isOn, forKey: "isOn")
        aCoder.encode(self.praAdzan, forKey: "praAdzan")
    }
}


