//
//  ReticleNode.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 28/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

class ReticleNode: SCNNode {

    var reticleHeight: Float!;

    override init() {
        super.init();

        let node = SCNScene(named: "ReticleScene")!.rootNode;
        node.position = SCNVector3Zero;
        self.addChildNode(node);

        self.reticleHeight = node.childNode(withName: "reticle", recursively: true)!.position.y;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
