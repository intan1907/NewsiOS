//
//  LoginWorker.swift
//  GITSAuth
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

struct LoginWorker {
    static func doLogin(username:String, pass: String, onSuccess: @escaping ()-> Void, onFailed: @escaping onError) {
        var message = ""
        
        if username.isEmpty && pass.isEmpty {
            message = "Username dan password tidak boleh kosong"
        }
        
        if !username.isEmpty && pass.isEmpty {
            message = "Password tidak boleh kosong"
        }
        
        if username.isEmpty && !pass.isEmpty {
            message = "Username tidak boleh kosong"
        }
        
        if message == "" {
            if (username == "intan" && pass == "intan") {
                message = "Login berhasil"
            } else {
                message = "Username atau Password salah"
            }
        } else {
            onFailed(message)
        }
    }
    
    static func doLoginSocMed(){
        
    }
}
