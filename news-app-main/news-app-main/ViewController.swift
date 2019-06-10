//
//  ViewController.swift
//  news-app-main
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import GITSPresentWireframe
import GITSFramework
import GITSAuth

class ViewController: UIViewController {

    var performDelegate: GITSPerformDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GITSAuthWireframe.performLogin(caller: self, perform: performDelegate, data: [:])
    }

}

extension ViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configPerform(vc: self)
    }
    
    func configPerform(vc: ViewController) {
        let present = GITSPresentWireframe.init()
        vc.performDelegate = present
    }
}

