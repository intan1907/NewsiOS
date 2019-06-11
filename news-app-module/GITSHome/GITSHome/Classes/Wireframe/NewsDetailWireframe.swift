//
//  NewsDetailWireframe.swift
//  GITSHome
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework


public class NewsDetailWireframe{
    public static func initNewsDetailVC(perform: GITSPerformDelegate?) -> UINavigationController {
        let storyboard = UIStoryboard(name: "NewsDetailView", bundle: bundleDetail)
        let vc = storyboard.instantiateInitialViewController() as! UINavigationController
        let vc_nav = vc.topViewController as! NewsDetailVC
        vc_nav.performDelegate = perform
        return vc
    }
    
    
    static var bundleDetail:Bundle {
        let podBundle = Bundle(for: NewsDetailVC.self)
        let bundleURL = podBundle.url(forResource: "GITSHome", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
