//
//  MainViewController+ARSessionDelegate.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 29/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import ARKit

extension MainViewController: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        self.scene.update(for: frame, inSize: self.contentView.sceneView.bounds.size);
    }

    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        self.contentView.isUserInteractionEnabled = !camera.trackingState.canWork;
    }
}

private extension ARCamera.TrackingState {
    var canWork: Bool {
        switch self {
        case .notAvailable:
            return true;
        case .limited(let reason):
            switch reason {
            case .initializing, .relocalizing: return true;
            default: return false;
            }
        default: return false;
        }
    }
}

