//
//  ToptalARSession.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 25/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import ARKit

class ToptalARSession: ARSession {

    init(delegate: ARSessionDelegate) {
        super.init();
        self.delegate = delegate;
    }

    func resetTracking() {
        print("Reseting Tracking");
        self.run(.default, options: [ARSession.RunOptions.removeExistingAnchors]);
    }

    func pauseTracking() {
        print("Pausing Tracking");
        self.pause();
    }
}

private extension ARConfiguration {
    static var `default`: ARConfiguration {
        let result = ARWorldTrackingConfiguration();
        result.isAutoFocusEnabled = true;
        result.planeDetection = .horizontal;
        result.worldAlignment = .gravityAndHeading;

        return result;
    }
}
