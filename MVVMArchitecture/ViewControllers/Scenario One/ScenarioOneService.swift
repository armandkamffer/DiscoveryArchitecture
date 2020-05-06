//
//  ScenarioOneService.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

protocol ScenarioOneAbstractService {
    func loadData(completion: @escaping (ScenarioOneResponse?, Error?) -> ())
}

class ScenarioOneService: ScenarioOneAbstractService {
    func loadData(completion: @escaping (ScenarioOneResponse?, Error?) -> ()) {
        //Do WSGKit network call here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let response = ScenarioOneResponse(items: [
                ScenarioOneItemResponse(title: "One", cost: 200),
                ScenarioOneItemResponse(title: "Two", cost: 500),
                ScenarioOneItemResponse(title: "Three", cost: 800.8888),
                ScenarioOneItemResponse(title: "Four", cost: 200000000)
            ])
            completion(response, nil)
        }
    }
}

class ScenarioOneErrorService: ScenarioOneAbstractService {
    func loadData(completion: @escaping (ScenarioOneResponse?, Error?) -> ()) {
        //Do WSGKit network call here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(nil, NSError(domain: "ScenarioOne", code: 0, userInfo: nil))
        }
    }
}

class ScenarioOneResponse: Codable {
    var items: [ScenarioOneItemResponse]
    
    init(items: [ScenarioOneItemResponse]) {
        self.items = items
    }
}

class ScenarioOneItemResponse: Codable {
    var title: String
    var cost: Decimal
    
    init(title: String, cost: Decimal) {
        self.title = title
        self.cost = cost
    }
}
