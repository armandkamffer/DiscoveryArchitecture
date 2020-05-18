//
//  ScenarioOneCellFactoryTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioOneCellFactoryTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testCellWithValidData() {
        // Given: a mock item and an indexPath
        let mockItem = Mocks.scenarioOneItem
        let indexPath = IndexPath(item: 0, section: 0)
        
        // When: The cell is mapped
        let cell = ScenarioOneCellFactory().cell(for: mockItem, in: mockTableView, at: indexPath)
        
        // Then: TitleInfoTableViewCell is expected as the cell type
        XCTAssert(cell.isMember(of: TitleInfoTableViewCell.self))
    }
    
    func testCellWithValidNilData() {
        // Given: a mock item and an indexPath
        let mockItem = Mocks.nilScenarioOneItem
        let indexPath = IndexPath(item: 0, section: 0)
        
        // When: The cell is mapped
        let cell = ScenarioOneCellFactory().cell(for: mockItem, in: mockTableView, at: indexPath)
        
        // Then: UITableViewCell is expected as the cell type
        XCTAssert(cell.isMember(of: UITableViewCell.self))
    }
}

fileprivate class Mocks {
    static let scenarioOneItem = ScenarioOneItem(title: "Test", cost: "R1000")
    static let nilScenarioOneItem: ScenarioOneItem? = nil
}
