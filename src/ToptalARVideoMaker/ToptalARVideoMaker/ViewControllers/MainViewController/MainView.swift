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
    func showVirtualObjectsList(source: UIView);
}

class MainView: UIView {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var recordButton: RecordButton!
    @IBOutlet weak var addButton: AddButton!
    @IBOutlet weak var recordingIndicator: UIView!

    weak var delegate: MainViewDelegate?;

    var isRecording: Bool = false {
        didSet {
            self.recordingIndicator.backgroundColor = self.isRecording ? UIColor.toptalRed : UIColor.toptalGreen;
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview();

        self.isRecording = false;
        self.recordButton.delegate = self;
    }

    override func layoutSubviews() {
        super.layoutSubviews();

        self.recordingIndicator.layer.cornerRadius = self.recordingIndicator.bounds.height / 2.0;
        self.recordingIndicator.layer.masksToBounds = true;
    }

    @IBAction func addButtonTouchUpInside(_ sender: AddButton) {
        self.delegate?.showVirtualObjectsList(source: sender);
    }
}

extension MainView: RecordButtonDelegate {

    func recordButtonTouchBegan(for button: RecordButton) {
        self.isRecording = true;
        self.delegate?.startRecording();
    }

    func recordButtonTouchEnd(for button: RecordButton) {
        self.isRecording = false;
        self.delegate?.stopRecording();
    }
}
