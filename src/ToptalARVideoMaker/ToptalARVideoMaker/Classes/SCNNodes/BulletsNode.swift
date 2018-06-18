//
//  BulletNode.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

class BulletsNode: SCNNode {

    override init() {
        super.init();

        let positions = Randomness.gaussian(center: SCNVector3Zero, count: 50);
        for pos in positions {
            let node = SCNNode(geometry: sphereGeometry());
            node.position =  pos;
            self.addChildNode(node);
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func sphereGeometry() -> SCNGeometry {
        let sphere = SCNSphere(radius: 0.005);
        sphere.firstMaterial?.diffuse.contents = UIColor.red;
        sphere.firstMaterial?.reflective.contents = UIColor.gray;
        sphere.firstMaterial?.metalness.contents = 0.3;
        sphere.firstMaterial?.lightingModel = .physicallyBased;

        return sphere;
    }
}
