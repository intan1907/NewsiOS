//
//  BaseViewController.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit
import Alamofire
import SwiftMessages
import HexColors

open class  BaseViewController: UIViewController {
    public var baseDelegate: GITSRootDelegate?
    public var performDelegate: GITSPerformDelegate?
    public var dbDelegate: GITSDBDelegate?
    var loadingView: MbloadingView?
    public var heightStatusNavBar: CGFloat = 0
    public var request: DataRequest?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.heightStatusNavBar = (UIDevice.current.model != "iPad" ? UIApplication.shared.statusBarFrame.size.height : 0)  +
//            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        self.heightStatusNavBar = (UIApplication.shared.statusBarFrame.size.height)  + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc open func deviceRotated() {
        self.heightStatusNavBar = (UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0))
        self.baseDelegate?.didRotate()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    open func configTitleView() {
        let titleView = TitleView.instantiateFromNib()
        self.navigationItem.titleView  = titleView
    }
    
    open func configLeftTitleView() {
        let titleView = TitleView.instantiateFromNib()
        let barButton = UIBarButtonItem(customView: titleView)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    open func configStepNavView(totalProgressView: Int, activeProgress: Int, spacing: CGFloat, defaultProgressColor: UIColor, progressColor: UIColor) {
        let navView = ProgressStepNavView.instantiateFromNib()
        navView.setupProgressView(totalProgressView: totalProgressView, activeProgress: activeProgress, spacing: spacing, defaultProgressColor: defaultProgressColor, progressColor: progressColor)
        self.navigationItem.titleView = navView
    }
    
    open func configTransparantBar(color: String) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor(color)
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    open func configColorBar(color: String, navColor: String) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor(color)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor(navColor)
        self.navigationController?.navigationBar.barTintColor = UIColor(navColor)
        self.navigationController?.navigationBar.backgroundColor = UIColor(navColor)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(color) ?? UIColor.black]
    }
    
    func configBackButton(){
        let yourBackImage = UIImage(named: "backArrow")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
    
    open func configTopConstraint(constraint: NSLayoutConstraint) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:  //iphone X
                constraint.constant = -88
                break
            default:
                if #available(iOS 11.0, *) {
                    constraint.constant = -64
                } else {
                    constraint.constant = 0
                }
            }
        }
    }
}

extension BaseViewController {
    open func showMessage(message: String, error: Bool) {
        createMessage(message: message, error: error)
    }
    
    func createMessage(message: String, error: Bool) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureContent(title: "", body: message, iconImage: nil, iconText:"", buttonImage: nil, buttonTitle: "", buttonTapHandler: nil)
        view.tapHandler = { _ in
            SwiftMessages.hide()
        }
        view.configureDropShadow()
        view.button?.isHidden = true
        if error {
            view.configureTheme(.error, iconStyle: .light)
        } else {
            view.configureTheme(.success, iconStyle: .light)
        }
        
        var config = SwiftMessages.defaultConfig
        // FIXME: Value of type 'SwiftMessages.Config' has no member 'presentationContext'; did you mean 'presentationStyle'?
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .top
        config.duration = .automatic
        config.interactiveHide = true
        SwiftMessages.hideAll()
        SwiftMessages.show(config: config, view: view)
    }
}

extension BaseViewController: MbloadingProtocol {
    open func showLoading(view: UIView){
        loadingView = MbloadingView.instantiateFromNib()
        loadingView?.loadInView(view: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    open func showLoadNet(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    open func stopLoadNet(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    open func stopLoading(isError: Bool, message: String){
        if isError {
            showTryAgain(message: message)
        } else {
            loadingView?.stop()
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    public func doTryAgain(button: UIButton) {
        baseDelegate?.doTryAgain()
    }
    
    func showTryAgain(message:String) {
        loadingView?.showTryAgain(message: message, delegate: self)
    }
}

extension BaseViewController {
    
    open func getSetupLanguage()-> String {
        let lang = GITSPref.getString(key: GITSPref.KEY_LANGUAGE)
        if lang == "id" {
            GITSPref.saveString(key: GITSPref.KEY_LANGUAGE, value: lang)
        }
        else{
            GITSPref.saveString(key: GITSPref.KEY_LANGUAGE, value: lang)
        }
        return lang
    }
    
    open func showAlertController(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction]) {
        let alertController: UIAlertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        for action in actions {
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    open func openSettingsby(path: String){
        if let url = URL(string:path) {
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
