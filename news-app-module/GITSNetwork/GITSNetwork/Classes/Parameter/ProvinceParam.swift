//
//  ProvinceParam.swift
//  GITSNetwork
//
//  Created by Tri Rejeki on 29/03/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Foundation

public struct ProvinceParam {
    public var page: Int?
    public var limit: Int?
    public var orderBy: String?
    public var descending: String?
    
    public init(page: Int?, limit: Int?, orderBy: String?, descending: String?) {
        self.page = page
        self.limit = limit
        self.orderBy = orderBy
        self.descending = descending
    }
    
    public func asParam()->[String: Any] {
        return ["page": self.page ?? 0, "limit": self.limit ?? 0, "orderBy": self.orderBy ?? "", "descending": self.descending ?? ""]
    }
}

