//
//  BaseViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 15/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<T: UIView>: UIViewController {

    var contentView: T {
        return self.view as! T;
    }
}
