//
//  BaseViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 15/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

protocol ContentViewController where Self: UIViewController {
    associatedtype ContentView;
    var contentView: ContentView { get }
}

extension ContentViewController {
    var contentView: ContentView {
        return self.view as! ContentView;
    }
}
