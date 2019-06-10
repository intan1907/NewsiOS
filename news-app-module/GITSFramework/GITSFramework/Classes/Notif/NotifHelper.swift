//
//  NotifHelper.swift
//  jadwalsholat
//
//  Created by Ajie Pramono Arganata on 25/04/18.
//  Copyright © 2018 GITS INDONESIA. All rights reserved.
//

import Foundation
import UserNotifications
import GITSNetwork
import SwiftMessages

public class NotifHelper {
    public static func manageLocalNotif(data: [JadwalModel]){
        NotifHelper.removeLocalNotification()
        for i in 0..<2*data.count{
            if i < data.count{
                let dt = data [i]
                if dt.praAdzan! != 0 {
                    self.createLocalNotif(id: dt.name! + "-" + dt.date! + " pra", title: "Waktu " + dt.name! + " akan tiba.", message: "Assalamu’alaikum Teman-Teman", time: dt.time!, praAdzan: dt.praAdzan!, isOn: (dt.isOn!) ? "1" : "2")
                }
                self.createLocalNotif(id: dt.name! + "-" + dt.date!, title: "Waktu " + dt.name! + " telah tiba.", message: "Assalamu’alaikum Teman-Teman", time: dt.time!, praAdzan: 0, isOn: (dt.isOn!) ? "1" : "0")
            }else{
                let dt = data [i-data.count]
                self.createLocalNotif(id: dt.name! + "-" + dt.date!, title: "Waktu " + dt.name! + " telah tiba.", message: "Assalamu’alaikum Teman-Teman", time: dt.time!, praAdzan: 0, isOn: (dt.isOn!) ? "1" : "0")
            }
        }
    }
    
    public static func removeLocalNotification(){
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.removeAllPendingNotificationRequests()
        } else {
            // Fallback on earlier versions
        }
    }
    
    public static func createLocalNotif(id: String, title: String, message: String, time: String, praAdzan: Int, isOn: String) {
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.subtitle = message
            content.body = title
            if isOn == "2" || id.contains("pra") == true{
                content.sound = UNNotificationSound.default
            }else{
                if isOn == "0"{
                    content.sound = nil
                }else{
                    content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "adhan-notif.aif"))
                }
            }
            content.categoryIdentifier = "JadwalSholat-\(GITSDateHelper.dateParseToString(Date(), newFormat: "yyyyMMddHHmmss"))"
            
            let userInfo = [
                "aps": [
                    "alert": [
                        "id": id,
                        "body": message,
                        "title": title]
                ],
                "sound": "adhan-notif.aif"
                ] as [String : Any]
            
            //setup aps local
            content.userInfo = userInfo
            var date = DateComponents()
            date.hour = Int(time.components(separatedBy: ":")[0])
            date.minute = Int(time.components(separatedBy: ":")[1])
            
            if date.minute! < praAdzan{
                if date.hour == 0{
                    date.hour = Int(time.components(separatedBy: ":")[0])! - 1 + 24
                }else{
                    date.hour = Int(time.components(separatedBy: ":")[0])! - 1
                }
                date.minute = Int(time.components(separatedBy: ":")[1])! - praAdzan + 60
            }else{
                date.minute = Int(time.components(separatedBy: ":")[1])! - praAdzan
            }
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            
            //Set the request for the notification from the above
            let request = UNNotificationRequest(
                identifier: id,
                content: content,
                trigger: trigger
            )
            let center = UNUserNotificationCenter.current()
            //Add the notification to the currnet notification center
            center.add(request, withCompletionHandler: { (error) in
                if let err = error {
                    print(err.localizedDescription)
                }
            })
        } else {
            let notification:UILocalNotification = UILocalNotification()
            notification.category = "JadwalSholat-\(GITSDateHelper.dateParseToString(Date(), newFormat: "yyyyMMddHHmmss"))"
            if #available(iOS 8.2, *) {
                notification.alertTitle = title
            } else {
                notification.alertAction = title
                // Fallback on earlier versions
            }
            
            let userInfo = [
                "aps": [
                    "alert": [
                        "id": id,
                        "body": message,
                        "title": title]
                ],
                "sound": "marimba-sound.aiff"
                ] as [String : Any]
            
            //setup aps local
            notification.userInfo = userInfo
            notification.fireDate = Date()
            notification.alertBody = title
            notification.soundName = "marimba-sound.aiff"
            UIApplication.shared.scheduleLocalNotification(notification)
        }
    }
    
    public static func handleNotifOnActive(title: String, message: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: message, body: title, iconImage: UIImage(named: "AppIcon"), iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: nil)
        view.tapHandler = { _ in
            SwiftMessages.hide()
        }
        view.configureTheme(backgroundColor: UIColor("#f1f2f2")!, foregroundColor: UIColor.black, iconImage: UIImage(named: "iconAboutUs"), iconText: "")
        view.configureDropShadow()
        view.button?.isHidden = true
        view.iconLabel?.isHidden = true
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        config.interactiveHide = true
        SwiftMessages.hideAll()
        SwiftMessages.show(config: config, view: view)
    }
}

