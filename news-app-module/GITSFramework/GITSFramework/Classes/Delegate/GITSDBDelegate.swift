//
//  GITSDBDelegate.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 29/03/19.
//  Copyright © 2019 GITS Indonesia. All rights reserved.
//

import Foundation

public protocol GITSDBDelegate {
    func insertJadwal(result: [[String:Any]])
    func deleteEntity(entityNm: String)
    func defaultShowJadwal()
    func fetchShowJadwal(date: String) -> [[String:Any]]
    func updateNotificationJadwal(prayTime: String, minutes:Int) -> Bool
    func updateSoundJadwal(prayTime: String, isSound:Bool) -> Bool
    func updateDisplayJadwal(prayTime: String, isDisplay:Bool) -> Bool
    func entityIsEmpty(entity: String) -> Bool
    func fetchJadwalByDateString(date: String) -> [String:Any]?
}
