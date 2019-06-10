//
//  ProgressView.swift
//  GITSFramework
//
//  Created by Alvira Nurhaliza Wijaya on 11/03/19.
//  Copyright © 2019 GITS Indonesia. All rights reserved.
//

import UIKit

public class ProgressView: UIView {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressHeight: NSLayoutConstraint!
    
}

public extension ProgressView {
    
    func setupView(defaultProgressColor defColor: UIColor, progressColor progColor: UIColor, progressHeight height: CGFloat = 5) {
        self.progressView.trackTintColor = defColor
        self.progressView.progressTintColor = progColor
        self.progressView.progress = 1
        self.progressHeight.constant = height
    }
    
}

public extension ProgressView {
    
    public class func instantiateFromNib() -> ProgressView {
        return UINib(nibName: "ProgressView", bundle: bundle).instantiate(withOwner: nil, options: [:])[0] as! ProgressView
    }
    
    static var bundle: Bundle {
        let podBundle = Bundle(for: ProgressView.self)
        let bundleURL = podBundle.url(forResource: "GITSFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        } else {
            return Bundle(url: bundleURL!) ?? Bundle()
        }
    }
}
