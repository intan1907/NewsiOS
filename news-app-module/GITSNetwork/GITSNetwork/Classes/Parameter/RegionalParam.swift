//
//  RegionalParam.swift
//  GITSNetwork
//
//  Created by Tri Rejeki on 29/03/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Foundation

public struct RegionalParam {
    public var provId: Int?
    public var page: Int?
    public var limit: Int?
    public var orderBy: String?
    public var descending: String?
    
    public init(provId: Int?, page: Int?, limit: Int?, orderBy: String?, descending: String?) {
        self.provId = provId
        self.page = page
        self.limit = limit
        self.orderBy = orderBy
        self.descending = descending
    }
    
    public func asParam()->[String: Any] {
        return ["province_id":self.provId ?? 0,"page": self.page ?? 0, "limit": self.limit ?? 0, "orderBy": self.orderBy ?? "", "descending": self.descending ?? ""]
    }
}
