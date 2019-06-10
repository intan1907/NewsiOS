//
//  CustomBB8Slider.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 27/02/19.
//  Copyright © 2019 GITS Indonesia. All rights reserved.
//

class CustomBB8Slider: UISlider {
    
    
    let label = UILabel()
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let track = super.beginTracking(touch, with: event)
        label.text = "\(Int(self.value))"
        label.frame = CGRect.init(x: self.thumbCenterX, y: -10, width: 20, height: 20)
        self.addSubview(label)
        return track
    }
    
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let track = super.continueTracking(touch, with: event)
        label.frame = CGRect.init(x: self.thumbCenterX - 5 , y: 6, width: 30, height: 20)
        label.text = "\(Int(self.value))"
        return track
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        label.removeFromSuperview()
    }}



extension UISlider {
    var thumbCenterX: CGFloat {
        let trackRect = self.trackRect(forBounds: frame)
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: bounds, value: value)
        return thumbRect.midX
    }}
