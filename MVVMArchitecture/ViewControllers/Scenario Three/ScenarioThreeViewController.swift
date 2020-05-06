//
//  ScenarioOneViewController.swift
//  MVVMArchitecture
//
//  Created by Armand Kamffer on 2020/04/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

class ScenarioThreeViewController: MEMTableViewController {
    private var viewModel: ScenarioThreeViewModel
    private var tableFactory: ScenarioThreeTableFactory
    
    init(with viewModel: ScenarioThreeViewModel) {
        self.viewModel = viewModel
        self.tableFactory = ScenarioThreeTableFactory()
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
        viewModel.loadResponse { [weak self] (error) in
            self?.hideLoading()
            if let error = error {
                self?.handleError(error)
                return
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

extension ScenarioThreeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groups?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.itemInGroup(at: indexPath)
        return tableFactory.cell(for: item, in: tableView, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCountInGroup(section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let group = viewModel.group(at: section)
        return tableFactory.header(for: group)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let group = viewModel.group(at: section)
        return tableFactory.headerHeight(for: group)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == viewModel.groups?.index(before: viewModel.groups?.endIndex ?? 0) {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNormalMagnitude
    }
}
