//
//  ViewExtension.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 4/12/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class UIHelper {
    public static func toast(message:String,vc:UIViewController){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.present(alert, animated: true, completion: nil)
        let duration:TimeInterval = 1; // duration in seconds
        let time = DispatchTime.now().uptimeNanoseconds
        let tes = UInt64(duration * Double(NSEC_PER_SEC))
        let jum = time + tes
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: jum)) {
            vc.dismiss(animated: true, completion: nil)
        }
        
    }
    
    public static func cornerRadius(view: UIView, rectCorners:UIRectCorner, caCorners:CACornerMask, radius: CGFloat){
        if #available(iOS 11.0, *){
            view.clipsToBounds = false
            view.layer.cornerRadius = radius
            view.layer.maskedCorners = caCorners
        }else{
            view.roundCorners(corners: rectCorners, radius: radius)
        }
    }
    
    public static func convertViewAsImage(customView:UIView) -> UIImage {
        return customView.asImage()
    }
}

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
