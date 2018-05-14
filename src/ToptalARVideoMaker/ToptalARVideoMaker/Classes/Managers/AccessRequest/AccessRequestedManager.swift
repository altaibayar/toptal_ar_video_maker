//
//  AccessRequestedService.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 14/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation

enum AccessState {
    case granted, unknown, declined;
}

protocol AccessRequestedManager {
    var currentState: AccessState { get }
    func withRequestedAccess(_ completion: @escaping (Bool) -> Swift.Void );
}
