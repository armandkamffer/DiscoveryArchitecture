//
//  ScenarioOneMapper.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioOneMapper {
    static func mapItems(with response: ScenarioOneResponse?) -> [ScenarioOneItem] {
        guard let response = response else {
            return []
        }
        return response.items.map {
            ScenarioOneItem(title: $0.title, cost: $0.cost.currency ?? "-")
        }
    }
}

class ScenarioOneItem {
    var title: String
    var cost: String
    
    init(title: String, cost: String) {
        self.title = title
        self.cost = cost
    }
}
