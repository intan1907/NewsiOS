//
//  NotifModel.swift
//  jadwalsholat
//
//  Created by IRFAN TRIHANDOKO on 08/05/18.
//  Copyright © 2018 GITS INDONESIA. All rights reserved.
//

import Foundation

public class NotifModel: NSObject, NSCoding {
    public var id: String?
    public var title: String?
    public var body: String?
    public var name: String?
    
    public init(id: String?, title: String?, body: String?, name: String?){
        self.id = id
        self.title = title
        self.body = body
        self.name = name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.body = aDecoder.decodeObject(forKey: "body") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.body, forKey: "body")
        aCoder.encode(self.name, forKey: "name")
    }
}


