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
    func update(for frame: ARFrame, inSize size: CGSize) {
        let center = CGPoint(x: size.width / 2.0, y: size.height / 2.0);

        guard let hitTest = frame.hitTest(center, types: .existingPlaneUsingExtent).first else {
            self.hideReticle();
            return;
        }

        self.showReticle();
        self.reticleNode.position = hitTest.worldTransform.vector3;
    }
}

extension ToptalARScene {
    func showReticle() {
        self.reticleNode.runAction(SCNAction.hide());
    }

    func hideReticle() {
        self.reticleNode.runAction(SCNAction.unhide());
    }
}

private extension matrix_float4x4 {
    var vector3: SCNVector3 {
        return SCNVector3(self.columns.3.x, self.columns.3.y, self.columns.3.z);
    }
}
