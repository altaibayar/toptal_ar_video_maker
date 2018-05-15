//
//  MainView.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit

protocol MainViewDelegate: class {
    func startRecording();
    func stopRecording();
}

class MainView: UIView {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var recordButton: RecordButton!

    weak var delegate: MainViewDelegate?;

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);

        self.layer.borderWidth = 8.0;
        self.layer.borderColor = UIColor.clear.cgColor;
        if UIDevice.current.isIPhoneX {
            self.layer.cornerRadius = 39.0;
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview();

        self.recordButton.delegate = self;
    }
}

extension MainView: RecordButtonDelegate {

    func recordButtonTouchBegan(for button: RecordButton) {
        self.layer.borderColor = UIColor.toptalRed.cgColor;

        self.delegate?.startRecording();
    }

    func recordButtonTouchEnd(for button: RecordButton) {
        self.layer.borderColor = UIColor.clear.cgColor;

        self.delegate?.stopRecording();
    }
}
