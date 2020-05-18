//
//  ScenarioThreeCellFactoryTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioThreeCellFactoryTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testInfoCellFactoryCellType() {
        // Given: A mock ScenarioThreeItem and IndexPath
        let mockItem = Mocks.infoItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is created in the ScenarioThreeInfoCellFactory
        let cell = ScenarioThreeInfoCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleInfoTableViewCell
        XCTAssert(cell.isMember(of: TitleInfoTableViewCell.self))
    }
    
    func testDescriptionCellFactoryCellType() {
        // Given: A mock ScenarioThreeItem and IndexPath
        let mockItem = Mocks.descriptionItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is created in the ScenarioThreeDescriptionCellFactory
        let cell = ScenarioThreeDescriptionCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleDescriptionTableViewCell
        XCTAssert(cell.isMember(of: TitleDescriptionTableViewCell.self))
    }
}

fileprivate class Mocks {
    static let infoItem = ScenarioThreeItem(title: "Detail", cost: "R5000", type: .info)
    static let descriptionItem = ScenarioThreeItem(title: "Summary", cost: "R5000", type: .description)
}
