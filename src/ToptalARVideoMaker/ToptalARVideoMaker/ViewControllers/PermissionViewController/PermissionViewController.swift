//
//  PermissionViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

class PermissionViewController: UIViewController, ContentViewController {
    typealias ContentView = PermissionView;

    private let cameraAccessManager: AccessRequestedManager = CameraManager();
    private let galleryAccessManager: AccessRequestedManager = GalleryManager();
    private let recordingAccessManager: AccessRequestedManager = RecordingManager();

    override func viewDidLoad() {
        super.viewDidLoad();

        self.contentView.delegate = self;
        self.contentView.cameraAccessManager = self.cameraAccessManager;
        self.contentView.galleryAccessManager = self.galleryAccessManager;
        self.contentView.recordingAccessManager = self.recordingAccessManager;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        if self.cameraAccessManager.stateDetermined && self.galleryAccessManager.stateDetermined && self.recordingAccessManager.stateDetermined {
            self.performSegue(withIdentifier: "main", sender: nil);
        }
    }
}

extension PermissionViewController: PermissionViewDelegate {
    func permissionViewIsDone(_ view: PermissionView) {
        self.performSegue(withIdentifier: "main", sender: nil);
    }
}
