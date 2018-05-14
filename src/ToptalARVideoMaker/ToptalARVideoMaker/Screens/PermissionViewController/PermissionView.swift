//
//  PermissionView.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

protocol PermissionViewDelegate: class {
    func permissionViewIsDone(_ view: PermissionView)
}

class PermissionView: UIView {
    @IBOutlet weak var cameraSwitch: UISwitch!
    @IBOutlet weak var photosSwitch: UISwitch!
    @IBOutlet weak var nextButton: NextButton!

    weak var delegate: PermissionViewDelegate?;
    var cameraAccessManager: AccessRequestedManager!
    var galleryAccessManager: AccessRequestedManager!

    override func didMoveToSuperview() {
        super.didMoveToSuperview();

        setStates();
    }

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender == cameraSwitch {
            self.cameraAccessManager.withRequestedAccess { _ in self.setStates(); }
        } else if sender == photosSwitch {
            self.galleryAccessManager.withRequestedAccess { _ in self.setStates(); }
        }
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.permissionViewIsDone(self);
    }

    func setStates() {
        setSwitchState(switch: cameraSwitch, access: cameraAccessManager);
        setSwitchState(switch: photosSwitch, access: galleryAccessManager);

        self.nextButton.isEnabled = !cameraAccessManager.needsRequest && !galleryAccessManager.needsRequest;
    }

    private func setSwitchState(switch view: UISwitch, access: AccessRequestedManager) {

        switch access.currentState {
        case .granted:
            view.setOn(true, animated: true);
            view.isEnabled = false;
        case .declined:
            view.setOn(false, animated: true);
            view.isEnabled = false;
        case .unknown:
            view.setOn(false, animated: true);
            view.isEnabled = true;
        }
    }
}

private extension AccessRequestedManager {

    var needsRequest: Bool {
        switch self.currentState {
        case .unknown: return true;
        default: return false;
        }
    }
}
