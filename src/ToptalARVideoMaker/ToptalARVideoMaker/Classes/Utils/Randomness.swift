//
//  Randomness.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 17/06/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import SceneKit
import GameplayKit

class Randomness {

    static func gaussian(center: SCNVector3, count: Int) -> [SCNVector3] {
        let rand = GKGaussianDistribution(lowestValue: -10, highestValue: +10);
        return (0 ..< count).map { _ in
            var pos = center;
            pos.addNoise(rand: rand);
            return pos;
        }
    }
}

extension SCNVector3 {

    mutating func addNoise() {
        //generates numbers between -50cm...50cm
        let rand = GKShuffledDistribution(lowestValue: -50, highestValue: 50);
        addNoise(rand: rand);
    }

    fileprivate mutating func addNoise(rand: GKRandom) {
        let cm: () -> Float = { return Float(rand.nextInt()) / 100.0;  }

        self.x += cm();
        self.y += cm();
        self.z += cm();
    }
}
