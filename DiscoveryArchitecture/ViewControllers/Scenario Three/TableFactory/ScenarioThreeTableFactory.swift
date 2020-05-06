//
//  ScenarioOneCellFactory.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioThreeTableFactory {
    private let cellCreators: [ScenarioThreeItemType:ScenarioThreeCellAbstractFactory]
    private let headerCreators: [ScenarioThreeGroupType:ScenarioThreeHeaderAbstractFactory]
    
    init() {
        cellCreators = [
            .info: ScenarioThreeInfoCellFactory(),
            .description: ScenarioThreeDescriptionCellFactory()
        ]
        
        headerCreators = [
            .summary: ScenarioThreeSummaryHeaderFactory(),
            .detail: ScenarioThreeDetailHeaderFactory()
        ]
    }
    
    func cell(for item: ScenarioThreeItem?, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let item = item,
            let creator = cellCreators[item.type] else {
            return UITableViewCell()
        }
        return creator.cell(for: item, in: tableView, at: indexPath)
    }
    
    func header(for group: ScenarioThreeGroup?) -> UIView? {
        guard let group = group,
            let creator = headerCreators[group.type] else {
            return nil
        }
        return creator.header(for: group)
    }
    
    func headerHeight(for group: ScenarioThreeGroup?) -> CGFloat {
        guard let group = group,
            headerCreators[group.type] != nil,
            group.title != nil else {
            return 35
        }
        return UITableView.automaticDimension
    }
}
