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
    @IBOutlet weak var addButton: AddButton!

    weak var delegate: MainViewDelegate?;

    var isRecording: Bool = false {
        didSet {
            self.layer.borderColor = isRecording ? UIColor.toptalRed.cgColor : UIColor.clear.cgColor;
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);

        self.layer.borderColor = UIColor.clear.cgColor;
        if UIDevice.current.isIPhoneX {
            self.layer.cornerRadius = 39.0;
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview();
        self.recordButton.delegate = self;
    }

    @IBAction func addButtonTouchUpInside(_ sender: AddButton) {
        
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
