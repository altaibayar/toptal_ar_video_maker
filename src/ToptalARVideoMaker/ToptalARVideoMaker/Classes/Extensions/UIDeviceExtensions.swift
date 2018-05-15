//
//  UIDeviceExtensions.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 15/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    var isIPhoneX: Bool {
        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            let safeInset = window.safeAreaInsets;
            return safeInset.top > 0;
        }

        return false;
    }
}
