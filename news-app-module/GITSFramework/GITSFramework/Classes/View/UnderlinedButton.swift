//
//  UnderlinedButton.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 08/12/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class UnderlinedButton: UIButton {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let text = titleLabel?.text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        // Add other attributes if needed
        self.titleLabel!.attributedText = attributedText
    }
}
