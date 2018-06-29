//
//  MainViewController+ARSCNViewDelegate.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 29/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import Metal

extension MainViewController: ARSCNViewDelegate {

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard
            let planeAnchor = anchor as? ARPlaneAnchor,
            let planeGeometry = ARSCNPlaneGeometry(device: self.device)
            else {
                return nil;
        }

        planeGeometry.update(from: planeAnchor.geometry);
        return PlaneNode(from: planeGeometry);
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {

        guard
            let placenAnchor = anchor as? ARPlaneAnchor,
            let planeNode = node as? PlaneNode
            else {
                return;
        }

        planeNode.update(planeGeometry: placenAnchor.geometry);
    }

    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {

    }
}
