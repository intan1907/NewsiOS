//
//  ImageViewExtension.swift
//  Pods
//
//  Created by GITS Indonesia on 3/17/17.
//
//

import Foundation

extension UIImage {
    public var uncompressedPNGData: Data      { return self.pngData()!        }
    public var highestQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 1.0)!  }
    public var highQualityJPEGNSData: Data    { return self.jpegData(compressionQuality: 0.75)!  }
    public var mediumQualityJPEGNSData: Data  { return self.jpegData(compressionQuality: 0.5)!  }
    public var lowQualityJPEGNSData: Data     { return self.jpegData(compressionQuality: 0.25)!  }
    public var lowestQualityJPEGNSData:Data   { return self.jpegData(compressionQuality: 0.0)!  }
    
    public class func outlinedEllipse(size: CGSize, color: UIColor, lineWidth: CGFloat = 1.0) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(lineWidth)
        let rect = CGRect(origin: .zero, size: size).insetBy(dx: lineWidth * 0.5, dy: lineWidth * 0.5)
        context.addEllipse(in: rect)
        context.strokePath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

/*
 Just replace
 
 guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
 with:
 
 guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
 
 */
