//
//  Scenarios.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioOne: Scenario {
    var title: String = "Scenario One"
    var items: [ScenarioItem] = [
        ScenarioOneSingle(),
        ScenarioOneError()
    ]
}

class ScenarioOneSingle: ScenarioItem {
    var title: String = "Single cell type"
    
    func viewController() -> UIViewController {
        let viewModel = ScenarioOneViewModel()
        return ScenarioOneViewController(with: viewModel)
    }
}

class ScenarioOneError: ScenarioItem {
    var title: String = "Error state"
    
    func viewController() -> UIViewController {
        let viewModel = ScenarioOneViewModel()
        viewModel.configure(service: ScenarioOneErrorService())
        return ScenarioOneViewController(with: viewModel)
    }
}
