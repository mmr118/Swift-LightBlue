//
//  UIApplication+LightBlue.swift
//  Swift-LightBlue
//
//  Created by Pluto Y on 4/20/16.
//  Copyright © 2016 Pluto-y. All rights reserved.
//

import UIKit

extension UIApplication {

    class func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
        guard let controller = viewController ?? presentingViewController else { return nil }

        if let nav = controller as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }

        if let tab = controller as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = controller.presentedViewController {
            return topViewController(presented)
        }

        return controller
    }

    private static var presentingViewController: UIViewController? {
        let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
        return rootViewController?.presentedViewController ?? rootViewController

    }

}
