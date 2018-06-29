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
import SceneKitVideoRecorder

class MainViewController: UIViewController, ContentViewController {
    typealias ContentView = MainView

    internal let device = MTLCreateSystemDefaultDevice()!;

    var session: ToptalARSession!
    let scene = ToptalARScene();
    let virtualObjectDataSource = VirtualObjectDataSource();
    var recorder: SceneKitVideoRecorder!

    override func viewDidLoad() {
        super.viewDidLoad();

        self.session = ToptalARSession(delegate: self);
        
        self.contentView.sceneView.session = session;
        self.contentView.sceneView.scene = scene;

        self.contentView.delegate = self;
        self.contentView.sceneView.delegate = self;

        //I am optimistic
        self.recorder = try! SceneKitVideoRecorder(scene: self.contentView.sceneView);

        self.contentView.sceneView.debugOptions = [ ARSCNDebugOptions.showFeaturePoints ];
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        self.scene.resetContent();
        self.session.resetTracking();
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: false);

        self.recorder.cleanUp();
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);

        self.session.pauseTracking();
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNodes" {
            guard let vc = segue.destination as? SelectNodeViewController else {
                fatalError();
            }

            if let popover = vc.popoverPresentationController, let source = sender as? UIView {
                popover.delegate = self;
                popover.sourceView = source;
                popover.sourceRect = source.bounds;
            }

            vc.virtualObjectDataSource = self.virtualObjectDataSource;
            vc.delegate = self;

        } else if segue.identifier == "export" {

            guard
                let vc = segue.destination as? ExportViewController,
                let url = sender as? URL
                else {
                    fatalError();
            }

            vc.videoUrl = url;
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
}

extension MainViewController: MainViewDelegate {
    func startRecording() {
        self.scene.hideReticle();

        print("starting recording");
        self.recorder.startWriting().onSuccess {
            print("recording started");
        }
    }

    func stopRecording() {
        self.scene.showReticle();
        print("stopping recording");
        self.recorder.finishWriting().onSuccess { [weak self] url in
            print("recording stopped");
            self?.performSegue(withIdentifier: "export", sender: url);
        }
    }

    func showVirtualObjectsList(source: UIView) {
        self.performSegue(withIdentifier: "showNodes", sender: source);
    }
}

extension MainViewController: SelectNodeViewControllerDelegate {
    func selectNodeViewController(_ vc: SelectNodeViewController, selected: VirtualObject) {
        self.scene.addVirtualObject(object: selected);
    }
}

extension MainViewController: UIPopoverPresentationControllerDelegate { }
