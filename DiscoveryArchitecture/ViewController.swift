//
//  ViewController.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func scenarioOneTapped(_ sender: Any) {
        let viewModel = ScenarioOneViewModel()
        let viewController = ScenarioOneViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func scenarioOneErrorTapped(_ sender: Any) {
        let viewModel = ScenarioOneViewModel()
        viewModel.configure(service: ScenarioOneErrorService())
        let viewController = ScenarioOneViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func scenarioTwoTapped(_ sender: Any) {
        let viewModel = ScenarioTwoViewModel()
        let viewController = ScenarioTwoViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func scenarioTwoDynamicSectionsTapped(_ sender: Any) {
        let viewModel = ScenarioTwoViewModel()
        viewModel.configure(service: ScenarioTwoNilTotalCostService())
        let viewController = ScenarioTwoViewController(with: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func scenarioThreeTapped(_ sender: Any) {
        
    }
}

