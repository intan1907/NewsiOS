//
//  CircleImageViewExtension.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 4/13/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class CircleImageView: UIImageView {
    @IBInspectable public var borderWidth: CGFloat = 0
    @IBInspectable public var borderColor: UIColor = UIColor.clear
    
    @IBInspectable var shadowOffsetWidth: CGFloat = 0.0
    @IBInspectable var shadowOffsetHeigth: CGFloat = 0.0
    @IBInspectable var shadowRadius: CGFloat = 0.0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.0
    @IBInspectable var isShadow: Bool = false
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        //Shadow
        if isShadow {
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: frame.height/2)
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: self.shadowOffsetWidth, height: self.shadowOffsetHeigth);
            layer.shadowOpacity = self.shadowOpacity
            layer.shadowRadius = self.shadowRadius
            layer.shadowPath = shadowPath.cgPath
            layer.masksToBounds = isShadow ? false : true
        }
    }
}
