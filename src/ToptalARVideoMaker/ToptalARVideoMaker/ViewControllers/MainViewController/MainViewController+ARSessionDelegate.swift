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
        guard false == self.contentView.isRecording else {
            //if recording in progress, then do nothing
            return;
        }

        self.scene.update(for: frame);
    }

    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        print("Camera state changed \(camera.trackingState)")
        self.contentView.isUserInteractionEnabled = camera.trackingState.canWork;
    }
}

private extension ARCamera.TrackingState {
    var canWork: Bool {
        switch self {
        case .notAvailable:
            return false;
        case .limited(let reason):
            switch reason {
            case .initializing, .relocalizing: return false;
            default: return true;
            }
        default: return true;
        }
    }
}

