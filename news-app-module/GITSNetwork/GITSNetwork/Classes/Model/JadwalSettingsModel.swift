//
//  JadwalSettingsModel.swift
//  GITSNetwork
//
//  Created by IRFAN TRIHANDOKO on 28/05/18.
//  Copyright © 2018 GITS INDONESIA. All rights reserved.
//

import Foundation

public class JadwalSettingsModel: NSObject, NSCoding{
    public var name: String?
    public var praAdzan: Int?
    public var isOn: String?
    public var soundName: String?
    
    public init(name: String?, praAdzan: Int?, isOn: String?, soundName: String?){
        self.name = name
        self.praAdzan = praAdzan
        self.isOn = isOn
        self.soundName = soundName
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.praAdzan = aDecoder.decodeObject(forKey: "praAdzan") as? Int
        self.isOn = aDecoder.decodeObject(forKey: "isOn") as? String
        self.soundName = aDecoder.decodeObject(forKey: "soundName") as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.praAdzan, forKey: "praAdzan")
        aCoder.encode(self.isOn, forKey: "isOn")
        aCoder.encode(self.soundName, forKey: "soundName")
    }
}
