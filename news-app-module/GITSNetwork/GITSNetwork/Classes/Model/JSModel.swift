//
//  JSModel.swift
//  GITSHome
//
//  Created by Tri Rejeki on 21/03/19.
//  Copyright © 2019 GITS. All rights reserved.
//

import Foundation

public struct JSModel {
    public var ashar: String?
    public var dhuha: String?
    public var dzuhur: String?
    public var imsak: String?
    public var isya: String?
    public var maghrib: String?
    public var subuh: String?
    public var terbit: String?
    public var tanggal: String?
    public var id: String?
    
    public init (ashar: String?, dhuha: String?, dzuhur: String?, imsak: String?, isya: String?, maghrib: String?, subuh: String?, terbit: String?, id: String?, tanggal: String?) {
        self.ashar = ashar
        self.dhuha = dhuha
        self.dzuhur = dzuhur
        self.imsak = imsak
        self.isya = isya
        self.maghrib = maghrib
        self.subuh = subuh
        self.terbit = terbit
        self.id = id
        self.tanggal = tanggal
    }
    
    public func convertToStringAny()-> [String: Any] {
        return [
            "ashar": self.ashar ?? "",
            "dhuha": self.dhuha ?? "",
            "dzuhur": self.dzuhur ?? "",
            "imsak": self.imsak ?? "",
            "isya": self.isya ?? "",
            "maghrib": self.maghrib ?? "",
            "subuh": self.subuh ?? "",
            "terbit": self.terbit ?? "",
            "id": self.id ?? "",
            "tanggal": self.tanggal ?? ""
        ]
    }
    
    public static func convertToObject(data: [String: Any]) -> JSModel {
        var param = JSModel(ashar: "", dhuha: "", dzuhur: "", imsak: "", isya: "", maghrib: "", subuh: "", terbit: "", id: "", tanggal: "")
        param.ashar = data["ashar"] as? String
        param.dhuha = data["dhuha"] as? String
        param.dzuhur = data["dzuhur"] as? String
        param.imsak = data["imsak"] as? String
        param.isya = data["isya"] as? String
        param.maghrib = data["maghrib"] as? String
        param.subuh = data["subuh"] as? String
        param.terbit = data["terbit"] as? String
        param.id = data["id"] as? String
        param.tanggal = data["tanggal"] as? String
        return param
    }
}

public struct JSDailyModel {
    public var timeName: String?
    public var timeInfo: String?
    public var adjustTime: Int?
    public var isSoundOn: Bool?
    
    public init (timeName: String?, timeInfo: String?, adjustTime: Int?, isSoundOn: Bool?) {
        self.timeName = timeName
        self.timeInfo = timeInfo
        self.adjustTime = adjustTime
        self.isSoundOn = isSoundOn
    }
    
    public func convertToStringAny()-> [String: Any] {
        return [
            "timeName": self.timeName ?? "",
            "timeInfo": self.timeInfo ?? "",
            "adjustTime": self.adjustTime ?? 0,
            "isSoundOn": self.isSoundOn ?? false
        ]
    }
    
    public static func convertToObject(data: [String: Any]) -> JSDailyModel {
        var param = JSDailyModel(timeName: "", timeInfo: "", adjustTime: 0, isSoundOn: false)
        param.timeName = data["timeName"] as? String
        param.timeInfo = data["timeInfo"] as? String
        param.adjustTime = data["adjustTime"] as? Int
        param.isSoundOn = data["isSoundOn"] as? Bool
        return param
    }
}
