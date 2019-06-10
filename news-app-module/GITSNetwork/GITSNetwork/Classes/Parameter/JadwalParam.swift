//
//  JadwalParam.swift
//  GITSNetwork
//
//  Created by Tri Rejeki on 27/03/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Foundation

public struct JadwalParam {
    public var latitude: String?
    public var longitude: String?
    
    public init(latitude: String?, longitude: String?) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func asParam()->[String: Any] {
        return ["latitude": self.latitude ?? "", "longitude": self.longitude ?? ""]
    }
}
