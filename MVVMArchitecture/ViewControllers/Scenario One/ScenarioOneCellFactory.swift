//
//  ScenarioOneCellFactory.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioOneCellFactory {
    func cell(for item: ScenarioOneItem?, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let item = item else {
            return UITableViewCell()
        }
        let cell = tableView.dequeuedCell(ofType: TitleInfoTableViewCell.self, indexPath: indexPath)
        cell.configure(title: item.title, info: item.cost)
        return cell
    }
}
