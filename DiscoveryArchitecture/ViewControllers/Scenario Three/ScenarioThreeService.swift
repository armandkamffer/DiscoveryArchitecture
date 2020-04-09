//
//  ScenarioOneService.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

protocol ScenarioThreeAbstractService {
    func loadData(completion: @escaping (ScenarioThreeResponse?, Error?) -> ())
}

class ScenarioThreeService: ScenarioThreeAbstractService {
    func loadData(completion: @escaping (ScenarioThreeResponse?, Error?) -> ()) {
        //Do WSGKit network call here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let response = ScenarioThreeResponse(
                totalCost: 200000000,
                detail: [
                    ScenarioThreeDetailResponse(title: "Benefit one", cost: 2000),
                    ScenarioThreeDetailResponse(title: "Benefit two", cost: 3425435435),
                    ScenarioThreeDetailResponse(title: "Benefit three", cost: 3023932234324243),
                    ScenarioThreeDetailResponse(title: "Benefit four", cost: 232532454)
                ]
            )
            completion(response, nil)
        }
    }
}

class ScenarioThreeResponse: Codable {
    var totalCost: Decimal?
    var detail: [ScenarioThreeDetailResponse]
    
    init(totalCost: Decimal?, detail: [ScenarioThreeDetailResponse]) {
        self.totalCost = totalCost
        self.detail = detail
    }
}

class ScenarioThreeDetailResponse: Codable {
    var title: String
    var cost: Decimal
    
    init(title: String, cost: Decimal) {
        self.title = title
        self.cost = cost
    }
}
