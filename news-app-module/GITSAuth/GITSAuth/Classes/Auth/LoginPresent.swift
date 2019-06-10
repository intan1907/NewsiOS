//
//  LoginPresent.swift
//  GITSAuth
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

protocol LoginRequest: BaseRequest {
    func doLogin(username: String, pass: String)
    func doLoginSocmed()
}

protocol LoginResponse: BaseResponse {
    func displayLogin()
}

struct LoginPresent: LoginRequest {
    var output: LoginResponse?
    
    func doLogin(username: String, pass: String) {
        LoginWorker.doLogin(username: username, pass:pass, onSuccess: {
            self.output?.displayLogin()
        }) { (error) in
            self.output?.displayError(message: error, object: "login")
        }
    }
    
    func doLoginSocmed() {
        //
    }
}

