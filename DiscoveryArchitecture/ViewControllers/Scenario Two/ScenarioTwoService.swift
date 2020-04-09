//
//  ScenarioOneService.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

protocol ScenarioTwoAbstractService {
    func loadData(completion: @escaping (ScenarioTwoResponse?, Error?) -> ())
}

class ScenarioTwoService: ScenarioTwoAbstractService {
    func loadData(completion: @escaping (ScenarioTwoResponse?, Error?) -> ()) {
        //Do WSGKit network call here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let response = ScenarioTwoResponse(
                totalCost: 200000000,
                detail: [
                    ScenarioTwoDetailResponse(title: "Benefit one", cost: 2000),
                    ScenarioTwoDetailResponse(title: "Benefit two", cost: 3425435435),
                    ScenarioTwoDetailResponse(title: "Benefit three", cost: 3023932234324243)
                ]
            )
            completion(response, nil)
        }
    }
}

class ScenarioTwoNilTotalCostService: ScenarioTwoAbstractService {
    func loadData(completion: @escaping (ScenarioTwoResponse?, Error?) -> ()) {
        //Do WSGKit network call here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let response = ScenarioTwoResponse(
                totalCost: nil,
                detail: [
                    ScenarioTwoDetailResponse(title: "Benefit one", cost: 2000),
                    ScenarioTwoDetailResponse(title: "Benefit two", cost: 3425435435),
                    ScenarioTwoDetailResponse(title: "Benefit three", cost: 3023932234324243)
                ]
            )
            completion(response, nil)
        }
    }
}

class ScenarioTwoResponse: Codable {
    var totalCost: Decimal?
    var detail: [ScenarioTwoDetailResponse]
    
    init(totalCost: Decimal?, detail: [ScenarioTwoDetailResponse]) {
        self.totalCost = totalCost
        self.detail = detail
    }
}

class ScenarioTwoDetailResponse: Codable {
    var title: String
    var cost: Decimal
    
    init(title: String, cost: Decimal) {
        self.title = title
        self.cost = cost
    }
}
