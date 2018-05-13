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
    @IBOutlet weak var nextButton: UIButton!

    weak var delegate: PermissionViewDelegate?;
}
