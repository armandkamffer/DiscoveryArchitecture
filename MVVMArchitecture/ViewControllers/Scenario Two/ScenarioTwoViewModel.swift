//
//  ScenarioOneViewModel.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class ScenarioTwoViewModel {
    private var service: ScenarioTwoAbstractService = ScenarioTwoService()
    private var response: ScenarioTwoResponse?
    private(set) var groups: [ScenarioTwoGroup]?
    
    func configure(service: ScenarioTwoAbstractService) {
        self.service = service
    }
    
    func loadResponse(completion: @escaping (Error?)->()) {
        service.loadData { [weak self] (response, error) in
            if let error = error {
                completion(error)
                return
            }
            self?.response = response
            self?.groups = ScenarioTwoMapper.mapGroups(with: response)
            completion(nil)
        }
    }
    
    func itemInGroup(at indexPath: IndexPath) -> ScenarioTwoItem? {
        return groups?.element(at: indexPath.section)?.items.element(at: indexPath.row)
    }
    
    func itemCountInGroup(_ section: Int) -> Int {
        return groups?.element(at: section)?.items.count ?? 0
    }
}
