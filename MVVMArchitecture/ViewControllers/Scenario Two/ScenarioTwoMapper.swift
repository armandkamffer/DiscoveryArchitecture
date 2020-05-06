//
//  ScenarioOneMapper.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioTwoMapper {
    static func mapGroups(with response: ScenarioTwoResponse?) -> [ScenarioTwoGroup] {
        guard let response = response else {
            return []
        }
        var groups = [ScenarioTwoGroup]()
        if let summaryGroup = mapSummaryGroup(with: response) {
            groups.append(summaryGroup)
        }
        groups.append(mapDetailGroup(with: response))
        return groups
    }
    
    static func mapSummaryGroup(with response: ScenarioTwoResponse) -> ScenarioTwoGroup? {
        guard let totalCost = response.totalCost else {
            return nil
        }
        let title = "All benefits"
        let totalCostText = totalCost.currency ?? "-"
        return ScenarioTwoGroup(items: [
            ScenarioTwoItem(title: title, cost: totalCostText, type: .summary)
        ])
    }
    
    static func mapDetailGroup(with response: ScenarioTwoResponse) -> ScenarioTwoGroup {
        let items = response.detail.map {
            ScenarioTwoItem(title: $0.title, cost: $0.cost.currency ?? "-", type: .detail)
        }
        return ScenarioTwoGroup(items: items)
    }
}

enum ScenarioTwoItemType {
    case summary
    case detail
}

class ScenarioTwoGroup {
    var items: [ScenarioTwoItem]
    
    init(items: [ScenarioTwoItem]) {
        self.items = items
    }
}

class ScenarioTwoItem {
    var type: ScenarioTwoItemType
    var title: String
    var cost: String
    
    init(title: String, cost: String, type: ScenarioTwoItemType) {
        self.title = title
        self.cost = cost
        self.type = type
    }
}
