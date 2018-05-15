//
//  ARKitUtils.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 15/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import ARKit

extension ARSession {
    static var `default`: ARSession {
        let result = ARSession();
        return result;
    }
}

extension ARConfiguration {
    static var `default`: ARConfiguration {
        let result = ARWorldTrackingConfiguration();
        result.isAutoFocusEnabled = true;
        result.planeDetection = .horizontal;

        return result;
    }
}
