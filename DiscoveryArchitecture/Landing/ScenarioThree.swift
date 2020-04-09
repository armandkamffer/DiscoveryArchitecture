//
//  ScenarioThree.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioThree: Scenario {
    var title: String = "Scenario Three"
    var items: [ScenarioItem] = [
        ScenarioThreeMultiple()
    ]
}

class ScenarioThreeMultiple: ScenarioItem {
    var title: String = "Multiple cell types and headers"
    
    func viewController() -> UIViewController {
        let viewModel = ScenarioThreeViewModel()
        return ScenarioThreeViewController(with: viewModel)
    }
}
