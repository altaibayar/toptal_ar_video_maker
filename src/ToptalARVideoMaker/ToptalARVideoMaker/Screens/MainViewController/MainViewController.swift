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

class MainViewController: UIViewController {

    internal let device = MTLCreateSystemDefaultDevice()!;

    var contentView: MainView {
        return self.view as! MainView;
    }

    var session: ToptalARSession!
    let scene = ToptalARScene();
    let virtualObjectDataSource = VirtualObjectDataSource();

    override func viewDidLoad() {
        super.viewDidLoad();

        self.session = ToptalARSession(delegate: self);
        
        self.contentView.sceneView.session = session;
        self.contentView.sceneView.scene = scene;

        self.contentView.delegate = self;
        self.contentView.sceneView.delegate = self;

        self.contentView.sceneView.debugOptions = [ ARSCNDebugOptions.showFeaturePoints ];
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

        self.session.resetTracking();
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
//                popover.delegate = self;
                popover.sourceView = source;
                popover.sourceRect = source.bounds;
            }

            vc.virtualObjectDataSource = self.virtualObjectDataSource;
            vc.delegate = self;
        }
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
}

//extension MainViewController: UIPopoverPresentationControllerDelegate {
//
//}

extension MainViewController: MainViewDelegate {
    func startRecording() {
        self.scene.hideReticle();
        print("start recording");
    }

    func stopRecording() {
        self.scene.showReticle();
        print("stop recording");
    }

    func showVirtualObjectsList(source: UIView) {
        self.performSegue(withIdentifier: "showNodes", sender: source);
    }
}

extension MainViewController: SelectNodeViewControllerDelegate {
    func selectNodeViewController(_ vc: SelectNodeViewController, selected: VirtualObject) {
        print("Selected: \(selected)");
        vc.dismiss(animated: true, completion: nil);
    }
}
