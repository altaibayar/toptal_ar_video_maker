//
//  PlaneNode.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 29/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class PlaneNode: SCNNode {

    var planeGeometry: ARSCNPlaneGeometry? {
        get { return self.geometry as? ARSCNPlaneGeometry; }
        set { self.geometry = newValue; }
    }

    init(from planeGeometry: ARSCNPlaneGeometry) {
        super.init();

        self.planeGeometry = planeGeometry;
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.toptalBlue.withAlphaComponent(0.0);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(planeGeometry: ARPlaneGeometry) {
        self.planeGeometry?.update(from: planeGeometry);
    }
}
