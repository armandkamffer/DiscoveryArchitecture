//
//  ScenarioOneMapper.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioThreeMapper {
    static func mapGroups(with response: ScenarioThreeResponse?) -> [ScenarioThreeGroup] {
        guard let response = response else {
            return []
        }
        var groups = [ScenarioThreeGroup]()
        if let summaryGroup = mapSummaryGroup(with: response) {
            groups.append(summaryGroup)
        }
        groups.append(mapDetailGroup(with: response))
        return groups
    }
    
    static func mapSummaryGroup(with response: ScenarioThreeResponse) -> ScenarioThreeGroup? {
        guard let totalCost = response.totalCost else {
            return nil
        }
        let title = "All benefits"
        let totalCostText = totalCost.currency ?? "-"
        return ScenarioThreeGroup(items: [
            ScenarioThreeItem(title: title, cost: totalCostText, type: .summary)
        ])
    }
    
    static func mapDetailGroup(with response: ScenarioThreeResponse) -> ScenarioThreeGroup {
        let items = response.detail.map {
            ScenarioThreeItem(title: $0.title, cost: $0.cost.currency ?? "-", type: .detail)
        }
        return ScenarioThreeGroup(items: items)
    }
}

enum ScenarioThreeItemType {
    case summary
    case detail
}

class ScenarioThreeGroup {
    var items: [ScenarioThreeItem]
    
    init(items: [ScenarioThreeItem]) {
        self.items = items
    }
}

class ScenarioThreeItem {
    var type: ScenarioThreeItemType
    var title: String
    var cost: String
    
    init(title: String, cost: String, type: ScenarioThreeItemType) {
        self.title = title
        self.cost = cost
        self.type = type
    }
}
