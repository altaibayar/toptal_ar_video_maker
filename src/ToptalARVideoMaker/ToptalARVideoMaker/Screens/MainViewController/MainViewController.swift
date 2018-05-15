//
//  MainViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class MainViewController: BaseViewController<MainView> {

    let session: ARSession = ARSession.default;
    let configuration: ARConfiguration = ARConfiguration.default;

    override func viewDidLoad() {
        super.viewDidLoad();

        self.contentView.delegate = self;
    }
}

extension MainViewController: MainViewDelegate {
    func startRecording() {
        print("start recording");
    }

    func stopRecording() {
        print("stop recording");
    }
}

extension MainViewController: ARSessionDelegate {

}
