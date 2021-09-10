//
//  Toast.swift
//  Pods
//
//  Created by WANG Jie on 03/10/2016.
//
//

import Foundation

import UIKit

public class Toast {

    var window: UIWindow? {
        return UIApplication.shared.keyWindow
    }

    private let text: String
    private let duration: Double
    private let bottomSpace: CGFloat?
    private let topSpace: CGFloat?

    public class Builder {
        fileprivate let text: String
        fileprivate var duration: Double = 2
        fileprivate var bottomSpace: CGFloat?
        fileprivate var topSpace: CGFloat?

        public init(text: String) {
            self.text = text
        }

        public func duration(_ duration: Double) -> Builder {
            self.duration = duration
            return self
        }

        public func bottomSpace(space: CGFloat) -> Builder {
            guard topSpace == nil else {
                fatalError("You can not set both top space and bottom space")
            }
            self.bottomSpace = space
            return self
        }

        public func topSpace(space: CGFloat) -> Builder {
            guard bottomSpace == nil else {
                fatalError("You can not set both top space and bottom space")
            }
            self.topSpace = space
            return self
        }

        public func build() -> Toast {
            return Toast(self)
        }
    }

    init(_ builder: Builder) {
        self.text = builder.text
        self.duration = builder.duration
        self.bottomSpace = builder.bottomSpace
        self.topSpace = builder.topSpace
    }

    var toastFrame: CGRect {
        let screenBounds = UIScreen.main.bounds
        let marginH: CGFloat = 20
        var windowFrame = CGRect(x: marginH, y: screenBounds.maxY-150, width: screenBounds.width-marginH*2, height: 44)
        if let bottomSpace = bottomSpace {
            windowFrame.origin.y = screenBounds.maxY-bottomSpace
        }
        if let topSpace = topSpace {
            windowFrame.origin.y = topSpace
        }
        return windowFrame
    }

    public func show() {
        guard let window = window else {
            preconditionFailure("The window can not be nil")
        }
        show(in: window)
    }

    public func show(`in` view: UIView) {
        let toast = UILabel(frame: toastFrame)
        toast.font = UIFont.systemFont(ofSize: 14)
        toast.numberOfLines = 0
        toast.textColor = UIColor.black
        toast.round(cornerRadius: 10)
        toast.textAlignment = .center
        toast.text = text
        toast.backgroundColor = UIColor(rgb: 0xFFEFE0).withAlphaComponent(0.8)
        toast.alpha = 0
        toast.minimumScaleFactor = 0.5
        toast.adjustsFontSizeToFitWidth = true

        view.addSubview(toast)
        UIView.animate(withDuration: 0.4) {
            toast.alpha = 1
        }
        delay(duration) {
            UIView.animate(withDuration: 0.4, animations: {
                toast.alpha = 0
            }, completion: { (completion) in
                toast.removeFromSuperview()
            })

        }
    }
}


func delay(_ delay: Double = 0, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+delay, execute: closure)
}

