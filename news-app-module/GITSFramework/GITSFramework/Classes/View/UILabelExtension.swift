//
//  UILabelExtension.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 31/07/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation

//extension UILabel {
//    
//    override open func awakeFromNib() {
//        if let text = text {
//            self.setText(text)
//        }
//    }
//    
//    public func setText(_ text: String) {
//        let data = text.data(using: .utf8)!
//        let att = try! NSAttributedString.init(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = self.textAlignment
//        let matt = NSMutableAttributedString(attributedString: att)
//        matt.enumerateAttribute(
//            NSAttributedString.Key.font,
//            in:NSMakeRange(0,matt.length),
//            options:.longestEffectiveRangeNotRequired) { value, range, stop in
//                let f1 = value as! UIFont
//                let f2 = UIFont(name: self.font.familyName, size: self.font.pointSize)!
//                if let f3 = applyTraitsFromFont(f1, to: f2) {
//                    matt.addAttribute(
//                        NSAttributedString.Key.font, value: f3, range: range)
//                    matt.addAttribute(NSAttributedString.Key.foregroundColor, value: self.textColor, range: range)
//                    matt.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
//                }
//        }
//        self.attributedText = matt
//    }
//    
//    func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
//        let t = f1.fontDescriptor.symbolicTraits
//        if let fd = f2.fontDescriptor.withSymbolicTraits(t) {
//            return UIFont.init(descriptor: fd, size: 0)
//        }
//        return nil
//    }
//    
//}
