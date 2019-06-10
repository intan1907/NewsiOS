//
//  RoundedImageView.swift
//  GITSFramework
//
//  Created by Ajie Pramono Arganata on 21/05/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import UIKit

public class RoundedImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 6.0 //default radius
    @IBInspectable var borderWidth: CGFloat = 0.0 //default border widht
    @IBInspectable var borderColor: UIColor = UIColor.clear //default border color
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    public func setCorner(radius: CGFloat) {
        cornerRadius = radius
        layer.cornerRadius = cornerRadius
    }
    
    public func setBorder(color: String) {
        borderColor = UIColor(color)!
        layer.borderColor = borderColor.cgColor
    }
    
    public func setBorder(width: CGFloat) {
        borderWidth = width
        layer.borderWidth = borderWidth
    }
}
