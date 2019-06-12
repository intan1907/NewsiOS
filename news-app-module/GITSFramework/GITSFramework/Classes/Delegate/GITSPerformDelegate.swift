//
//  GITSRootPerformDelegate.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 30/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation

public protocol GITSPerformDelegate {
    
    func doPerformToTab(vc: UIViewController, perform: GITSPerformDelegate?, data: [String: Any?])
    
    func doPerformToDetailNews(vc: UIViewController, perform: GITSPerformDelegate?, data: [String: Any?])
    
}

