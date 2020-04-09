//
//  ScenarioThreeCellFactory.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

protocol ScenarioThreeCellAbstractFactory {
    func cell(for item: ScenarioThreeItem, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
}

class ScenarioThreeInfoCellFactory: ScenarioThreeCellAbstractFactory {
    func cell(for item: ScenarioThreeItem, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeuedCell(ofType: TitleInfoTableViewCell.self, indexPath: indexPath)
        cell.configure(title: item.title, info: item.cost)
        return cell
    }
}

class ScenarioThreeDescriptionCellFactory: ScenarioThreeCellAbstractFactory {
    func cell(for item: ScenarioThreeItem, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeuedCell(ofType: TitleDescriptionTableViewCell.self, indexPath: indexPath)
        cell.configure(title: item.title, description: item.cost)
        return cell
    }
}
