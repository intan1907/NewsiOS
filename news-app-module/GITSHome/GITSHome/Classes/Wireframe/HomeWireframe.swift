//
//  HomeWireframe.swift
//  GITSHome
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework

public class HomeWireframe {
    
    public static func initHomeVC(perform: GITSPerformDelegate?) -> UINavigationController {
        let storyboard = UIStoryboard(name: "HomeView", bundle: bundleHome)
        let vc = storyboard.instantiateInitialViewController() as! UINavigationController
        let vc_nav = vc.topViewController as! HomeVC
        vc_nav.title = "Home"
        vc_nav.performDelegate = perform
        return vc
    }
    
    public static func performToTab(caller: UIViewController, perform: GITSPerformDelegate?) {
        let storyboard = UIStoryboard(name: "TabView", bundle: bundleHome)
        let vc = storyboard.instantiateInitialViewController()! as! TabVC
        vc.performDelegate = perform
        if(caller.navigationController == nil){
            caller.addChild(vc)
            caller.view.addSubview(vc.view)
            vc.didMove(toParent: caller)
        } else {
            caller.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    static var bundleHome:Bundle {
        let podBundle = Bundle(for: HomeVC.self)
        let bundleURL = podBundle.url(forResource: "GITSHome", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
