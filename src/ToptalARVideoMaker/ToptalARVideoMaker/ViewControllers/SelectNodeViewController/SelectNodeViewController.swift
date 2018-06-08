//
//  SelectNodeViewController.swift
//  ToptalARVideoMaker
//
//  Created by altaibayar tseveenbayar on 27/05/2018.
//  Copyright © 2018 tsevealt. All rights reserved.
//

import Foundation
import UIKit

protocol SelectNodeViewControllerDelegate: class {
    func selectNodeViewController(_ vc: SelectNodeViewController, selected: VirtualObject);
}

class SelectNodeViewController: UITableViewController {
    weak var virtualObjectDataSource: VirtualObjectDataSource?
    weak var delegate: SelectNodeViewControllerDelegate?;

    override func viewWillLayoutSubviews() {
        self.preferredContentSize = CGSize(width: 200, height: self.tableView.contentSize.height);
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let virtualObjectDataSource = self.virtualObjectDataSource else {
            fatalError();
        }

        return virtualObjectDataSource.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let virtualObjectDataSource = self.virtualObjectDataSource else {
            fatalError();
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") ?? UITableViewCell(style: .default, reuseIdentifier: "CELL");
        cell.backgroundColor = UIColor.clear;

        let object = virtualObjectDataSource.object(at: indexPath.row);
        cell.textLabel?.text = object.displayName;

        return cell;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let virtualObjectDataSource = self.virtualObjectDataSource else {
            fatalError();
        }

        tableView.deselectRow(at: indexPath, animated: true);
        self.delegate?.selectNodeViewController(self, selected: virtualObjectDataSource.object(at: indexPath.row));
    }
}
