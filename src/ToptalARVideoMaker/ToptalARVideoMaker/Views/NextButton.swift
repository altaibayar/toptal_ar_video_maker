//
//  NextButton.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

class NextButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.backgroundColor = UIColor.toptalGreen;
                self.setTitleColor(UIColor.white, for: .normal);
            } else {
                self.backgroundColor = UIColor.toptalRed;
                self.setTitleColor(UIColor.white, for: .normal);
            }
        }
    }

    override var contentEdgeInsets: UIEdgeInsets {
        get {
            return UIEdgeInsetsMake(20, 0.0, 20.0, 0.0);
        }
        set {

        }
    }
}
