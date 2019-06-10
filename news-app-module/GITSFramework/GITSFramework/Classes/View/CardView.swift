//
//  CardView.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 14/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import UIKit

public class CardView: UIView {
    @IBInspectable var borderWidth: CGFloat = 0 //default border widht
    @IBInspectable var borderColor: UIColor = UIColor.clear //default border color
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    @IBInspectable var shadowOffsetWidth: CGFloat = 0.0
    @IBInspectable var shadowOffsetHeigth: CGFloat = 1.0
    @IBInspectable var shadowRadius: CGFloat = 2.0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.4
    
    override public func layoutSubviews() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        
        //Shadow
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: self.shadowOffsetWidth, height: self.shadowOffsetHeigth);
        layer.shadowOpacity = self.shadowOpacity
        layer.shadowRadius = self.shadowRadius
        layer.shadowPath = shadowPath.cgPath
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public func reload() {
        setNeedsDisplay()
        layer.displayIfNeeded()
    }
}
