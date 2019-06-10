//
//  LoginVC.swift
//  GITSAuth
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework


class LoginVC: BaseViewController{
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var input: LoginRequest?
    
    @IBAction func loginTapped(_ sender: Any) {
        let uname = txtUsername.text ?? ""
        let pass = txtPassword.text ?? ""
        self.view.endEditing(true)
        self.showLoading(view: self.view)
        self.input?.doLogin(username: uname, pass: pass);
    }

}


extension LoginVC: LoginResponse {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    func config(vc: LoginVC) {
        var present = LoginPresent()
        present.output = vc
        vc.input = present
    }
    
    func displayLogin() {
        self.stopLoading(isError: false, message: "")
        self.showMessage(message: "login succeeded", error: false)
        performDelegate?.doPerformToTab(vc: self, perform: performDelegate, data: [:])
    }
    
    func displayError(message: String, object: Any) {
        self.stopLoading(isError: false, message: "")
        self.showMessage(message: message, error: true)
    }
}
