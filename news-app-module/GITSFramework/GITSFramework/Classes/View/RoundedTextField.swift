//
//  RoundedTextField.swift
//  GITSFramework
//
//  Created by Ajie Pramono Arganata on 12/09/18.
//

import Foundation

open class RoundedTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable open var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable public var iconImage: UIImage {
        get {
            return self.iconImage
        } set {
            let size = self.frame.size.height - 32
            let imageContainer = UIView(frame: CGRect(x: 0, y: 0, width: size + 12, height: size))
            imageContainer.backgroundColor = UIColor.clear
            let image = UIImageView(image: newValue)
            image.contentMode = .scaleAspectFit
            image.frame = CGRect(x: 0, y: 0, width: size, height: size)
            imageContainer.addSubview(image)
            imageContainer.addConstraints([
                NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: imageContainer, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: imageContainer, attribute: .centerY, multiplier: 1, constant: 0)])
            self.iconImageContainer = imageContainer
            self.rightView = imageContainer
            self.rightViewMode = .always
        }
    }
    
    var iconImageContainer: UIView?
    
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
                NSLayoutConstraint(item: progress, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -4),
                NSLayoutConstraint(item: progress, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)])
            progress.startAnimating()
            self.rightView = view
            self.rightViewMode = .always
        } else {
            self.rightView = self.iconImageContainer == nil ? nil : self.iconImageContainer
            self.rightViewMode = .always
        }
    }
}
