//
//  ViewController.swift
//  Interactions
//
//  Created by Priscilla Bevis on 13/9/17.
//  Copyright © 2017 Priscilla Bevis. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private enum Interactions: String {
        case CollapsingHeader = "Collapsing header"

        init?(rawValue: String) {
            switch rawValue {
            case Interactions.CollapsingHeader.rawValue: self = Interactions.CollapsingHeader
            default: return nil
            }
        }
    }
    
    private let interactions = [Interactions.CollapsingHeader]
    
    private enum Segue: String {
        case collapsingHeader
    }

    // MARK: - UITableView Datasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as! LabelTableViewCell
        cell.label.text = interactions[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactions.count
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = interactions[indexPath.row]
        switch option {
        case .CollapsingHeader: performSegue(withIdentifier: Segue.collapsingHeader.rawValue, sender: nil)
        }
    }
}

class LabelTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
}

