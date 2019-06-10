//
//  GitsLoginWireframe.swift
//  GitsLogin
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework

public class GITSAuthWireframe {
    public static func initLogin(perform: GITSPerformDelegate?) -> UIViewController{
        let storyboard = UIStoryboard(name: "Login", bundle: bundleLogin)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginVC
        return vc
    }
    
    public static func performLogin(caller: UIViewController, perform: GITSPerformDelegate?, data: [String: Any]) {
        let storyboard = UIStoryboard(name: "Login", bundle: bundleLogin)
        let vc = storyboard.instantiateInitialViewController() as! LoginVC
        vc.performDelegate = perform
        caller.present(vc, animated: true, completion: nil)
    }
    
    static var bundleLogin:Bundle {
        let podBundle = Bundle(for: LoginVC.self)
        let bundleURL = podBundle.url(forResource: "GITSAuth", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
    
}
