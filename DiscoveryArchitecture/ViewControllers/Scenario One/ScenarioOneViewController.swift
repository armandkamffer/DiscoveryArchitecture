//
//  ScenarioOneViewController.swift
//  DiscoveryArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioOneViewController: MEMTableViewController {
    private var viewModel: ScenarioOneViewModel
    private var cellFactory: ScenarioOneCellFactory
    
    init(with viewModel: ScenarioOneViewModel) {
        self.viewModel = viewModel
        self.cellFactory = ScenarioOneCellFactory()
        super.init(style: .grouped)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadResponse()
    }
    
    private func loadResponse() {
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
            self?.loadResponse()
        }
    }
}

extension ScenarioOneViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items?.element(at: indexPath.row)
        return cellFactory.cell(for: item, in: tableView, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items?.count ?? 0
    }
}
