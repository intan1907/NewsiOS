//
//  NewsModel.swift
//  GITSNetwork
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Foundation

public class NewsModel: NSObject{
    public var title: String?
    public var date: String?
    public var image: String?
    public var body: String?
    public var time: String?
    
    public init(title: String?, date: String?, image: String?) {
        self.title = title
        self.date = date
        self.image = image
    }
    
    public init(title: String?, date: String?, time: String?, image: String?, body: String?) {
        self.title = title
        self.date = date
        self.time = time
        self.image = image
        self.body = body
    }
}
