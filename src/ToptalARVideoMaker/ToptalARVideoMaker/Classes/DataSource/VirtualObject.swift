//
//  VirtualObject.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit

enum VirtualObject {
    case knife, bullet;
}

extension VirtualObject {
    var displayName: String {
        switch self {
        case .bullet: return "Bullet";
        case .knife: return "Knife";
        }
    }
}
