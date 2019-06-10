//
//  CircleButtonExtension.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 4/17/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class CircleButton: UIButton {
    @IBInspectable var shadowOffsetWidth: CGFloat = 1.0
    @IBInspectable var shadowOffsetHeigth: CGFloat = 1.0
    @IBInspectable var shadowRadius: CGFloat = 2.0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.4
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = frame.height/2
        self.clipsToBounds = true
        
        //Shadow
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: frame.height/2)
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: self.shadowOffsetWidth, height: self.shadowOffsetHeigth)
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowPath = shadowPath.cgPath
    }
}
