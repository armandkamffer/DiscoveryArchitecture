//
//  ScenarioOneViewModel.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioThreeViewModel {
    private var service: ScenarioThreeAbstractService = ScenarioThreeService()
    private var response: ScenarioThreeResponse?
    private(set) var groups: [ScenarioThreeGroup]?
    
    func configure(service: ScenarioThreeAbstractService) {
        self.service = service
    }
    
    func loadResponse(completion: @escaping (Error?)->()) {
        service.loadData { [weak self] (response, error) in
            if let error = error {
                completion(error)
                return
            }
            self?.response = response
            self?.groups = ScenarioThreeMapper.mapGroups(with: response)
            completion(nil)
        }
    }
    
    func group(at index: Int) -> ScenarioThreeGroup? {
        return groups?.element(at: index)
    }
    
    func itemInGroup(at indexPath: IndexPath) -> ScenarioThreeItem? {
        return groups?.element(at: indexPath.section)?.items.element(at: indexPath.row)
    }
    
    func itemCountInGroup(_ section: Int) -> Int {
        return groups?.element(at: section)?.items.count ?? 0
    }
}
