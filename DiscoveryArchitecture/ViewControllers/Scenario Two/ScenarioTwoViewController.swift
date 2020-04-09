//
//  ScenarioOneViewController.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioTwoViewController: MEMTableViewController {
    private var viewModel: ScenarioTwoViewModel
    private var cellFactory: ScenarioTwoCellFactory
    
    init(with viewModel: ScenarioTwoViewModel) {
        self.viewModel = viewModel
        self.cellFactory = ScenarioTwoCellFactory()
        super.init(style: .grouped)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    private func loadItems() {
        showLoading()
        viewModel.loadItems { [weak self] (error) in
            self?.hideLoading()
            if let error = error {
                self?.handleError(error)
            }
            self?.tableView.reloadData()
        }
    }
    
    private func handleError(_ error: Error) {
        showError { [weak self] in
            self?.loadItems()
        }
    }
}

extension ScenarioTwoViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groups?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.itemInGroup(at: indexPath)
        return cellFactory.cell(for: item, in: tableView, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCountInGroup(section)
    }
}
