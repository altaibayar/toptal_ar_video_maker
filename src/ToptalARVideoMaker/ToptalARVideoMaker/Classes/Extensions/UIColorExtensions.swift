//
//  UIColorExtensions.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    class var toptalGreen: UIColor {
        return UIColor.rgb(0, 204, 131);
    }

    class var toptalBlue: UIColor {
        return UIColor.rgb(36, 78, 207);
    }

    class var toptalRed: UIColor {
        return UIColor.rgb(220, 77, 77)
    }

    class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0);
    }
}
