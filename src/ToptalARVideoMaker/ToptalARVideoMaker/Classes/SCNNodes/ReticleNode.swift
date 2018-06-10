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

    let reticleHeight: CGFloat = 1.5;

    override init() {
        super.init();

        let node = SCNScene(named: "ReticleScene.scn")!.rootNode.childNode(withName: "reticle", recursively: true)!;
        node.position = SCNVector3Zero;
        self.addChildNode(node);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(position: SCNVector3) {
        self.position = position;
    }

    func showReticle() {
        if self.isHidden {
            self.runAction(SCNAction.unhide());
        }
    }

    func hideReticle() {
        if !self.isHidden {
            self.runAction(SCNAction.hide());
        }
    }
}
