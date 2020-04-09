//
//  ScenarioOneViewModel.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioOneViewModel {
    private var service: ScenarioOneAbstractService = ScenarioOneService()
    private var response: ScenarioOneResponse?
    private(set) var items: [ScenarioOneItem]?
    
    func configure(service: ScenarioOneAbstractService) {
        self.service = service
    }
    
    func loadItems(completion: @escaping (Error?)->()) {
        service.loadData { [weak self] (response, error) in
            if let error = error {
                completion(error)
                return
            }
            self?.response = response
            self?.items = ScenarioOneMapper.mapItems(with: response)
            completion(nil)
        }
    }
}
