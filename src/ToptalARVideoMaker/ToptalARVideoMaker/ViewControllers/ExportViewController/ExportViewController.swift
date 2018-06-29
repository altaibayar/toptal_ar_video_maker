//
//  ExportViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 13/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class ExportViewController: AVPlayerViewController {
    var videoUrl: URL! {
        didSet {
            self.player = AVPlayer(url: self.videoUrl);
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        self.navigationController?.setNavigationBarHidden(false, animated: false);

        self.entersFullScreenWhenPlaybackBegins = true;
        self.exitsFullScreenWhenPlaybackEnds = true;
    }

    @IBAction func actionButtonTapped(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [ self.videoUrl ], applicationActivities: nil);
        self.present(activityVC, animated: true, completion: nil);
    }
}

extension ExportViewController: ContentViewController {
    typealias ContentView = ExportView;
}
