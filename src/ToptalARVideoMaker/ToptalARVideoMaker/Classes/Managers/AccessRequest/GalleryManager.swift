//
//  GalleryManager.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 14/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import Photos

class GalleryManager: AccessRequestedManager {
    var currentState: AccessState {

        let state = PHPhotoLibrary.authorizationStatus();

        switch state {
        case .authorized, .restricted: return .granted;
        case .denied: return .declined;
        case .notDetermined: return .unknown;
        }
    }

    func withRequestedAccess(_ completion: @escaping (Bool) -> Void) {
        let state = self.currentState;

        switch state {
        case .unknown:
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    completion(self.currentState == .granted);
                }
            }

        default: completion(state == .granted);
        }
    }
}
