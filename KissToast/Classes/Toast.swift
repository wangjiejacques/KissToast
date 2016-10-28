//
//  Toast.swift
//  Pods
//
//  Created by WANG Jie on 03/10/2016.
//
//

import Foundation

import UIKit

private var toastWindow: UIWindow!

public class Toast {

    private let text: String
    private let duration: Double
    private let statusBarStyle: UIStatusBarStyle
    private let prefersStatusBarHidden: Bool
    private let bottomSpace: CGFloat?
    private let topSpace: CGFloat?

    public class Builder {
        fileprivate let text: String
        fileprivate var duration: Double = 2
        fileprivate var statusBarStyle: UIStatusBarStyle = .default
        fileprivate var prefersStatusBarHidden = false
        fileprivate var bottomSpace: CGFloat?
        fileprivate var topSpace: CGFloat?

        public init(text: String) {
            self.text = text
        }

        public func duration(_ duration: Double) -> Builder {
            self.duration = duration
            return self
        }

        public func statusBarStyle(_ statusBarStyle: UIStatusBarStyle) -> Builder {
            self.statusBarStyle = statusBarStyle
            return self
        }

        public func prefersStatusBarHidden(_ prefersStatusBarHidden: Bool) -> Builder {
            self.prefersStatusBarHidden = prefersStatusBarHidden
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
        self.statusBarStyle = builder.statusBarStyle
        self.prefersStatusBarHidden = builder.prefersStatusBarHidden
        self.bottomSpace = builder.bottomSpace
        self.topSpace = builder.topSpace
    }

    public func show() {
        guard toastWindow == nil else {
            return
        }
        let screenBounds = UIScreen.main.bounds
        let marginH: CGFloat = 20
        var windowFrame = CGRect(x: marginH, y: screenBounds.maxY-150, width: screenBounds.width-marginH*2, height: 50)
        if let bottomSpace = bottomSpace {
            windowFrame.origin.y = screenBounds.maxY-bottomSpace
        }
        if let topSpace = topSpace {
            windowFrame.origin.y = topSpace
        }
        toastWindow = UIWindow(frame: windowFrame)
        class NoStatusBarViewController: UIViewController {
            weak var toast: Toast!

            convenience init(toast: Toast) {
                self.init()
                self.toast = toast
            }
            override var preferredStatusBarStyle: UIStatusBarStyle {
                return toast.statusBarStyle
            }

            override var prefersStatusBarHidden: Bool {
                return toast.prefersStatusBarHidden
            }
        }
        toastWindow.rootViewController = NoStatusBarViewController()
        toastWindow.screen = UIScreen.main
        toastWindow.windowLevel = UIWindowLevelAlert

        let toast = UILabel(frame: toastWindow.bounds)
        toast.font = UIFont.boldSystemFont(ofSize: 17)
        toast.textColor = UIColor.white
        toast.round(cornerRadius: 4)
        toast.textAlignment = .center
        toast.text = text
        toast.backgroundColor = UIColor(rgb: 0x363636)
        toast.alpha = 0

        toastWindow.addSubview(toast)
        toastWindow.makeKeyAndVisible()
        UIView.animate(withDuration: 0.4) {
            toast.alpha = 1
        }
        delay(duration) {
            UIView.animate(withDuration: 0.4, animations: {
                toast.alpha = 0
                }, completion: { (completion) in
                    toastWindow = nil
            })
            
        }
    }
}


func delay(_ delay: Double = 0, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+delay, execute: closure)
}

