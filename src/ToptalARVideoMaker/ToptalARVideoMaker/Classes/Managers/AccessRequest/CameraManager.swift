//
//  CameraManager.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 14/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import AVKit

class CameraManager: AccessRequestedManager {
    var currentState: AccessState {
        let access = AVCaptureDevice.authorizationStatus(for: .video);
        switch access {
        case .authorized, .restricted: return .granted;
        case .denied: return .declined
        default: return .unknown;
        }
    }

    func withRequestedAccess(_ completion: @escaping (Bool) -> Void) {
        let state = self.currentState;

        switch state {
        case .unknown:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted);
                }
            }

        default: completion(state == .granted);
        }
    }
}
