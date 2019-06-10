//
//  RoundedBorderButton.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 4/12/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit
import HexColors

public class RoundedBorderButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 6.0 //default radius
    @IBInspectable var borderWidth: CGFloat = 1.0 //default border widht
    @IBInspectable var borderColor: UIColor = UIColor("#CDD6DF")! //default border color
    var title: String = ""
    var viewLoader: UIView?
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    override public func awakeFromNib() {
        if let text = self.titleLabel?.text {
            self.setText(text.localized)
            self.title = text
        }
    }
    
    public func setCorner(radius: CGFloat) {
        cornerRadius = radius
        layer.cornerRadius = cornerRadius
    }
    
    public func setBorder(color: String) {
        borderColor = UIColor(color)!
        layer.borderColor = borderColor.cgColor
    }
    
    public func setBorder(color: UIColor) {
        borderColor = color
        layer.borderColor = color.cgColor
    }
    
    public func setBorder(width: CGFloat) {
        borderWidth = width
        layer.borderWidth = borderWidth
    }
    
    public func setLoading(isLoad: Bool) {
        if isLoad {
            let size = self.frame.size.height - 32
            let view = UIView(frame: CGRect(x: 0, y: 0, width: size+12, height: size+16))
            view.backgroundColor = UIColor.clear
            let progress = UIActivityIndicatorView(style: .gray)
            view.addSubview(progress)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints([
                NSLayoutConstraint(item: progress, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: size),
                NSLayoutConstraint(item: progress, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: size),
                NSLayoutConstraint(item: progress, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: progress, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)])
            progress.startAnimating()
            self.addSubview(view)
            viewLoader = view
            self.addConstraints([
                NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            ])
            self.isEnabled = false
//            self.setText("")
        } else {
            self.viewLoader?.removeFromSuperview()
            self.isEnabled = true
//            self.setText(self.title)
        }
        self.awakeFromNib()
    }
}
