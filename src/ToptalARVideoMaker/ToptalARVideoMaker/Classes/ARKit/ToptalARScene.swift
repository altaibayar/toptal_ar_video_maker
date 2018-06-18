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
    let lightNode = DirectionalLightNode();

    override init() {
        super.init();

        self.reticleNode.hideReticle();
        self.rootNode.addChildNode(reticleNode);
        self.rootNode.addChildNode(self.lightNode);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError();
    }

    func addVirtualObject(object: VirtualObject) {
        let node: SCNNode;
        switch object {
        case .knife: node = KnifeNode();
        case .bullets: node = BulletsNode();
        }

        //default position
        var position = self.reticleNode.position;
        position.y += 1.0;
        node.position = position;

        self.rootNode.addChildNode(node);
    }
}

extension ToptalARScene {
    func update(for frame: ARFrame) {
        guard let hitTest = frame.hitTest(CGPoint(x: 0.5, y: 0.5), types: .existingPlane).first else {
            self.hideReticle();
            return;
        }

        self.showReticle();
        self.reticleNode.update(position: hitTest.worldTransform.vector3);
    }
}

extension ToptalARScene {
    func showReticle() {
        self.reticleNode.showReticle();
    }

    func hideReticle() {
        self.reticleNode.hideReticle();
    }
}

private extension matrix_float4x4 {
    var vector3: SCNVector3 {
        return SCNVector3(self.columns.3.x, self.columns.3.y, self.columns.3.z);
    }
}
