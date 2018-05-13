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

    override func viewDidLoad() {
        super.viewDidLoad();

        permissionView.delegate = self;
    }
}

extension PermissionViewController: PermissionViewDelegate {
    func permissionViewIsDone(_ view: PermissionView) {
        self.performSegue(withIdentifier: "main", sender: nil);
    }
}
