//
//  PermissionViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

class PermissionViewController: UIViewController {

    private var permissionView: PermissionView {
        return self.view as! PermissionView;
    }

    private let cameraAccessManager: AccessRequestedManager = CameraManager();
    private let galleryAccessManager: AccessRequestedManager = GalleryManager();

    override func viewDidLoad() {
        super.viewDidLoad();

        permissionView.delegate = self;
        permissionView.cameraAccessManager = self.cameraAccessManager;
        permissionView.galleryAccessManager = self.galleryAccessManager;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        if self.cameraAccessManager.stateDetermined && self.galleryAccessManager.stateDetermined {
            self.performSegue(withIdentifier: "main", sender: nil);
        }
    }
}

extension PermissionViewController: PermissionViewDelegate {
    func permissionViewIsDone(_ view: PermissionView) {
        self.performSegue(withIdentifier: "main", sender: nil);
    }
}
