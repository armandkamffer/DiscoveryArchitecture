//
//  ScenarioTwoCellFactoryTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioTwoCellFactoryTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testSummaryCellFactoryCellType() {
        // Given: A mock ScenarioTwoItem and IndexPath
        let mockItem = Mocks.summaryItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is mapped in the ScenarioTwoSummaryCellFactory
        let cell = ScenarioTwoSummaryCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleInfoTableViewCell
        XCTAssert(cell.isMember(of: TitleInfoTableViewCell.self))
    }
    
    func testDetailCellFactoryCellType() {
        // Given: A mock ScenarioTwoItem and IndexPath
        let mockItem = Mocks.detailItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is mapped in the ScenarioTwoDetailCellFactory
        let cell = ScenarioTwoDetailCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleDescriptionTableViewCell
        XCTAssert(cell.isMember(of: TitleDescriptionTableViewCell.self))
    }
    
    func testCellFactoryCellSummaryItemType() {
        // Given: A mock ScenarioTwoItem and IndexPath
        let mockItem = Mocks.summaryItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is mapped in the ScenarioTwoCellFactory
        let cell = ScenarioTwoCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleInfoTableViewCell
        XCTAssert(cell.isMember(of: TitleInfoTableViewCell.self))
    }
    
    func testCellFactoryCellDetailItemType() {
        // Given: A mock ScenarioTwoItem and IndexPath
        let mockItem = Mocks.detailItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A cell is mapped in the ScenarioTwoCellFactory
        let cell = ScenarioTwoCellFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleDescriptionTableViewCell
        XCTAssert(cell.isMember(of: TitleDescriptionTableViewCell.self))
    }
}

fileprivate class Mocks {
    static let detailItem = ScenarioTwoItem(title: "Detail", cost: "R5000", type: .detail)
    static let summaryItem = ScenarioTwoItem(title: "Summary", cost: "R5000", type: .summary)
}
