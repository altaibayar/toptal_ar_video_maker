//
//  MainViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class MainViewController: BaseViewController<MainView> {

    let session = ToptalARSession(delegate: nil);

    override func viewDidLoad() {
        super.viewDidLoad();
        self.contentView.sceneView.session = session;
        self.contentView.delegate = self;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        self.session.resetTracking();
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);

        self.session.pauseTracking();
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNodes" {
            
        }
    }
}

extension MainViewController: MainViewDelegate {
    func startRecording() {
        print("start recording");
    }

    func stopRecording() {
        print("stop recording");
    }
}

extension MainViewController: ARSessionDelegate {
    @nonobjc func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
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
