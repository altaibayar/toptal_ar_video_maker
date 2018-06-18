//
//  KnifeNode.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit
import SceneKit.ModelIO;

class KnifeNode: SCNNode {
    override init() {
        super.init();

        let url = Bundle.main.url(forResource: "knife", withExtension: "scn", subdirectory: "Knife")!;
        let node = try! SCNScene(url: url).rootNode;

        node.position = SCNVector3Zero;
        node.position.addNoise();
        
        self.addChildNode(node);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
