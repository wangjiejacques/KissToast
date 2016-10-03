//
//  UIColor+extension.swift
//  Pods
//
//  Created by WANG Jie on 03/10/2016.
//
//

import Foundation

import UIKit

extension UIColor {

    convenience init(rgb:Int) {
        let r = CGFloat(rgb >> 16) / 255
        let g = CGFloat((rgb & 0x00ff00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000ff) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }

    convenience init(rgb:Int, alpha: CGFloat) {
        let r = CGFloat(rgb >> 16) / 255
        let g = CGFloat((rgb & 0x00ff00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000ff) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
