//
//  ScenarioTwo.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioTwo: Scenario {
    var title: String = "Scenario Two"
    var items: [ScenarioItem] = [
        ScenarioTwoMultiple(),
        ScenarioTwoDynamic()
    ]
}

class ScenarioTwoMultiple: ScenarioItem {
    var title: String = "Multiple cell types"
    
    func viewController() -> UIViewController {
        let viewModel = ScenarioTwoViewModel()
        return ScenarioTwoViewController(with: viewModel)
    }
}

class ScenarioTwoDynamic: ScenarioItem {
    var title: String = "Dynamic sections"
    
    func viewController() -> UIViewController {
        let viewModel = ScenarioTwoViewModel()
        viewModel.configure(service: ScenarioTwoNilTotalCostService())
        return ScenarioTwoViewController(with: viewModel)
    }
}
