//
//  ToptaARScene.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 28/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class ToptalARScene: SCNScene {

    let reticleNode = ReticleNode();

    override init() {
        super.init();

        self.rootNode.addChildNode(reticleNode);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError();
    }

    func addVirtualObject(object: VirtualObject) {

    }
}

extension ToptalARScene {
    func update(for frame: ARFrame) {

    }
}

extension ToptalARScene {
    func showReticle() {

    }

    func hideReticle() {
        
    }
}
