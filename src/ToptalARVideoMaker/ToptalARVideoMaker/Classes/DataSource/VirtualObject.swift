//
//  VirtualObject.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

protocol VirtualObject {
    var displayName: String { get }
    func createNode() -> SCNNode;
}

