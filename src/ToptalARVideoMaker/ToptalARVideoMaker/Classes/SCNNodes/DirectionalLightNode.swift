//
//  DirectionalLightNode.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 17/06/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

class DirectionalLightNode: SCNNode {
    init(height: Float = 10.0) {
        super.init();

        let light = SCNLight();
        light.color = UIColor.white;
        light.shadowColor = UIColor.green;
        light.castsShadow = true;

        self.light = light;
        self.position = SCNVector3Make(0, height, 0);
        self.eulerAngles = SCNVector3(-Float.pi / 2.0, 0, 0);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
