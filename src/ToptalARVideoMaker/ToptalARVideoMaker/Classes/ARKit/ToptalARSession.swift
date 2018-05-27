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

    init(delegate: ARSessionDelegate?) {
        super.init();
        self.delegate = delegate;
    }

    func resetTracking() {
        self.run(.default, options: [ARSession.RunOptions.removeExistingAnchors]);
    }

    func pauseTracking() {
        self.pause();
    }
}

private extension ARConfiguration {
    static var `default`: ARConfiguration {
        let result = ARWorldTrackingConfiguration();
        result.isAutoFocusEnabled = true;
        result.planeDetection = .horizontal;

        return result;
    }
}
