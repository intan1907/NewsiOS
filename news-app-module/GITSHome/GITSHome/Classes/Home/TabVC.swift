//
//  HomeViCViewController.swift
//  GITSHome
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import GITSFramework

class TabVC: UITabBarController {
    
    var performDelegate: GITSPerformDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTab()
    }
    
    func setupTab(){
        let home = HomeWireframe.initHomeVC(perform: performDelegate)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), tag: 0)
        
        let bookmark = HomeWireframe.initHomeVC(perform: performDelegate)
        bookmark.tabBarItem = UITabBarItem(title: "Bookmark", image: UIImage(named: "ic_bookmark"), tag: 1)
        
        let vcs: [UIViewController] = [home, bookmark]
        self.setViewControllers(vcs, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
