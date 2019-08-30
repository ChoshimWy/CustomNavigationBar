//
//  UIViewController+NavigationBar.swift
//  CustomNavigationBar
//
//  Created by 享印科技 on 2019/8/30.
//  Copyright © 2019 Choshim丶Wy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Custom NavigationBar
    var _navigationBar: UIView {
        if let bar = objc_getAssociatedObject(self, &AssociatedKeys.navigationBar) as? UIView  {
            return bar
        }
        let bar = UIView()
        objc_setAssociatedObject(self, &AssociatedKeys.navigationBar, bar, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return bar
    }
    
    /// Setting Custom NavigationBar backgroundColor
    @objc var customNavigationBarBackgroundColor: UIColor? {
        if let color = objc_getAssociatedObject(self, &AssociatedKeys.barBackgroundColor) as? UIColor {
            return color
        }
        let color = UIColor.clear
        objc_setAssociatedObject(self, &AssociatedKeys.barBackgroundColor, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return color
    }
    
    /// Setting Custom barBarTintColo
    @objc var custombarBarTintColor: UIColor? {
        if let barBarTintColor = objc_getAssociatedObject(self, &AssociatedKeys.barBarTintColor) as? UIColor {
            return barBarTintColor
        }
        objc_setAssociatedObject(self, &AssociatedKeys.barBarTintColor, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return nil
    }
    
    /// Setting Custom barTintColor
    @objc var customBarTintColor: UIColor? {
        if let tintColor = objc_getAssociatedObject(self, &AssociatedKeys.barTintColor) as? UIColor {
            return tintColor
        }
        let tintColor = UIColor.darkText
        objc_setAssociatedObject(self, &AssociatedKeys.barTintColor, tintColor, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return tintColor
    }
    
    /// Setting Custom TitleTextAttributes
    @objc var customTitleTextAttributes: [NSAttributedString.Key: Any]? {
        if let attributes = objc_getAssociatedObject(self, &AssociatedKeys.titleTextAttributes) as? [NSAttributedString.Key: Any] {
            return attributes
        }
        objc_setAssociatedObject(self, &AssociatedKeys.titleTextAttributes, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return nil
    }
    
    /// Custom NavigationBar Swizzle
    static func swizzle() {
        let cls = UIViewController.self
        swizzleMethod(cls, #selector(UIViewController.viewDidLoad), #selector(UIViewController._viewDidLoad))
        swizzleMethod(cls, #selector(UIViewController.viewWillLayoutSubviews), #selector(UIViewController._viewWillLayoutSubviews))
        swizzleMethod(cls, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController._viewWillAppear(_:)))
        swizzleMethod(cls, #selector(UIViewController.viewDidAppear(_:)), #selector(UIViewController._viewDidAppear(_:)))
    }
    
    private struct AssociatedKeys {
        static var barBackgroundColor = "barBackgroundColor"
        static var navigationBar = "navigationBar"
        static var barTintColor = "barTintColor"
        static var barBarTintColor = "barBarTintColor"
        static var titleTextAttributes = "titleTextAttributes"
    }
    
     @objc private func _viewDidLoad() {
        if navigationController != nil {
            _navigationBar.backgroundColor = customNavigationBarBackgroundColor
            _navigationBar.layer.shadowColor = customNavigationBarBackgroundColor?.cgColor
            _navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
            _navigationBar.layer.shadowOpacity = 0.4
            _navigationBar.layer.shadowRadius = 4
            view.addSubview(_navigationBar)
        
           
        }
        _viewDidLoad()
    }
    
    @objc private func _viewWillLayoutSubviews() {
        if navigationController != nil {
            let navigationBarHeight: CGFloat = navigationController!.navigationBar.bounds.height + UIApplication.shared.statusBarFrame.height
            _navigationBar.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: navigationBarHeight))
            view.bringSubviewToFront(_navigationBar)
           
        }
        _viewWillLayoutSubviews()
    }
    
    @objc private func _viewWillAppear(_ animated: Bool) {
        if navigationController != nil {
            navigationController?.navigationBar.barTintColor = custombarBarTintColor
            navigationController?.navigationBar.tintColor = customBarTintColor
            navigationController?.navigationBar.titleTextAttributes = customTitleTextAttributes
            
        }
        _viewWillAppear(animated)
    }
    
    @objc private func _viewDidAppear(_ animated: Bool) {
        if let navigationController = self.navigationController {
            navigationController.interactivePopGestureRecognizer?.isEnabled = navigationController.viewControllers.count > 1
        }
        _viewDidAppear(animated)
    }
}

func swizzleMethod(_ cls: AnyClass, _ originSelector: Selector, _ newSelector: Selector) {
    guard let oriMethod = class_getInstanceMethod(cls, originSelector),
        let newMethod = class_getInstanceMethod(cls, newSelector) else {
            return
    }
    
    let isAddedMethod = class_addMethod(cls, originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))
    if isAddedMethod {
        class_replaceMethod(cls, newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod))
    } else {
        method_exchangeImplementations(oriMethod, newMethod)
    }
}
