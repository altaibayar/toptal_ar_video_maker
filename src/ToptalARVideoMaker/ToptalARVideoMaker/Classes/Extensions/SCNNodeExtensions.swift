//
//  SCNNodeExtensions.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 01/07/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

extension SCNNode {
    func hide() {
        if !self.isHidden {
            self.runAction(SCNAction.hide());
        }
    }

    func show() {
        if self.isHidden {
            self.runAction(SCNAction.unhide());
        }
    }
}
