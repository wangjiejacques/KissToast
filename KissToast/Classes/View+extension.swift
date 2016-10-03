//
//  View+extension.swift
//  Pods
//
//  Created by WANG Jie on 03/10/2016.
//
//

import Foundation
import UIKit

extension UIView {
    func round(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}
