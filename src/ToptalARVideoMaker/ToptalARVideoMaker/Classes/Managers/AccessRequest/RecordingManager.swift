//
//  RecordingManager.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 30/06/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import AVFoundation

class RecordingManager: AccessRequestedManager {
    var currentState: AccessState {
        let status = AVAudioSession.sharedInstance().recordPermission();
        switch status {
        case .granted: return .granted;
        case .denied: return .declined;
        case .undetermined: return .unknown;
        }
    }

    func withRequestedAccess(_ completion: @escaping (Bool) -> Void) {
        if self.currentState == .unknown {
            AVAudioSession.sharedInstance().requestRecordPermission { success in
                DispatchQueue.main.async {
                    completion(success);
                }
            }
        } else {
            completion(self.currentState == .granted);
        }
    }
}
