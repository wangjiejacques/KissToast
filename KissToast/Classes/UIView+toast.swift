//
//  UIView+toast.swift
//  KissToast
//
//  Created by WANG Jie on 2018/4/23.
//

import Foundation
import UIKit

public extension UIView {

    public func showBottomToast(text: String, bottomSpace: CGFloat = 150, duration: TimeInterval = 2) {
       Toast.Builder(text: text).duration(duration).bottomSpace(space: bottomSpace).build().show()
    }

    public func showTopToast(text: String, topSpace: CGFloat = 100, duration: TimeInterval = 2) {
        Toast.Builder(text: text).duration(duration).topSpace(space: topSpace).build().show()
    }
}
