//
//  NodesDataSource.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation

class VirtualObjectDataSource {

    private let allObjects: [VirtualObject];

    init() {
        allObjects = [ .knife, .bullets ];
    }

    var count: Int {
        return allObjects.count;
    }

    func object(at index: Int) -> VirtualObject {
        guard index >= 0 && index < self.allObjects.count else {
            fatalError();
        }

        return self.allObjects[index];
    }
}
