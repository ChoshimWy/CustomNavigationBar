//
//  UIImage+Color.swift
//  CustomNavigationBar
//
//  Created by 享印科技 on 2019/8/30.
//  Copyright © 2019 Choshim丶Wy. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    static func imageFromColor(_ color: UIColor, transparent: Bool = true, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(rect: rect)
        UIGraphicsBeginImageContextWithOptions(rect.size, !transparent, UIScreen.main.scale)
        
        var image: UIImage?
        if let context = UIGraphicsGetCurrentContext() {
            context.addPath(path.cgPath)
            context.setFillColor(color.cgColor)
            context.fillPath()
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image
    }
}
