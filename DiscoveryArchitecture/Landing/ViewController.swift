//
//  ViewController.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

protocol Scenario {
    var title: String { get }
    var items: [ScenarioItem] { get }
}

protocol ScenarioItem {
    var title: String { get }
    func viewController() -> UIViewController
}

class ViewController: UITableViewController {
    var scenarios: [Scenario] = [
        ScenarioOne(),
        ScenarioTwo(),
        ScenarioThree()
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return scenarios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = scenarios[indexPath.section].items[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return scenarios[section].title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = scenarios[indexPath.section].items[indexPath.row].viewController()
        viewController.title = scenarios[indexPath.section].items[indexPath.row].title
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scenarios[section].items.count
    }
}
