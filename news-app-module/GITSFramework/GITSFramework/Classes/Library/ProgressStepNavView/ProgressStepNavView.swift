//
//  ProgressStepNavView.swift
//  GITSFramework
//
//  Created by Alvira Nurhaliza Wijaya on 08/03/19.
//  Copyright © 2019 GITS Indonesia. All rights reserved.
//

import UIKit

public class ProgressStepNavView: UIView {

    @IBOutlet weak var stackView: UIStackView!
    
    override public var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }

}

public extension ProgressStepNavView {
    
    func setupProgressView(totalProgressView total: Int, activeProgress active: Int, spacing: CGFloat, defaultProgressColor defColor: UIColor, progressColor progColor: UIColor) {
//        let stackWidth = self.stackView.frame.width
//        let progressView = UIProgressView(progressViewStyle: .default)
        /*progressView.trackTintColor = defColor
        progressView.progressTintColor = progColor
        progressView.heightAnchor.constraint(equalToConstant: 5).isActive = true*/
        
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = spacing
        for index in 0..<total {
            let progressView = ProgressView.instantiateFromNib()
            progressView.setupView(defaultProgressColor: defColor, progressColor: progColor)
            progressView.progressView.progress = index < active ? 1 : 0
            self.stackView.addArrangedSubview(progressView)
        }
    }
    
}

public extension ProgressStepNavView {
    
    public class func instantiateFromNib() -> ProgressStepNavView {
        return UINib(nibName: "ProgressStepNavView", bundle: bundle).instantiate(withOwner: nil, options: [:])[0] as! ProgressStepNavView
    }
    
    static var bundle: Bundle {
        let podBundle = Bundle(for: ProgressStepNavView.self)
        let bundleURL = podBundle.url(forResource: "GITSFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        } else {
            return Bundle(url: bundleURL!) ?? Bundle()
        }
    }
}
