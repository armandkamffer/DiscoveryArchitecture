//
//  ScenarioThreeTableFactoryTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioThreeTableFactoryTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testCellInfoType() {
        // Given: A mock ScenarioThreeItem and IndexPath
        let mockItem = Mocks.infoItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A TableViewCell is created
        let cell = ScenarioThreeTableFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleInfoTableViewCell
        XCTAssert(cell.isMember(of: TitleInfoTableViewCell.self))
    }
    
    func testCellDescriptionType() {
        // Given: A mock ScenarioThreeItem and IndexPath
        let mockItem = Mocks.descriptionItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A TableViewCell is created
        let cell = ScenarioThreeTableFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type TitleDescriptionTableViewCell
        XCTAssert(cell.isMember(of: TitleDescriptionTableViewCell.self))
    }
    
    func testCellEmptyData() {
        // Given: An empty mock ScenarioThreeItem and IndexPath
        let mockItem = Mocks.nilItem
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: A TableViewCell is created
        let cell = ScenarioThreeTableFactory().cell(for: mockItem, in: mockTableView, at: mockIndexPath)
        
        // Then: The cell is of type UITableViewCell
        XCTAssert(cell.isMember(of: UITableViewCell.self))
    }
    
    func testHeaderSummaryType() {
        // Given: A mock summary group
        let mockGroup = Mocks.summaryHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeTableFactory().header(for: mockGroup)
        
        // Then: The header is of type TitleHeaderView
        XCTAssert(header?.isMember(of: TitleHeaderView.self) ?? false)
    }
    
    func testHeaderDetailType() {
        // Given: A mock detail group
        let mockGroup = Mocks.detailHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeTableFactory().header(for: mockGroup)
        
        // Then: The header is of type TitleDescriptionHeaderView
        XCTAssert(header?.isMember(of: TitleDescriptionHeaderView.self) ?? false)
    }
    
    func testHeaderMoreDetailType() {
        // Given: A mock more detail group
        let mockGroup = Mocks.moreDetailHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeTableFactory().header(for: mockGroup)
        
        // Then: Nil is returned
        XCTAssertNil(header)
    }
    
    func testHeaderHeightSummary() {
        // Given: A mock summary group
        let mockGroup = Mocks.summaryHeaderGroup
        
        // When: The header height is mapped
        let headerHeight = ScenarioThreeTableFactory().headerHeight(for: mockGroup)
        
        // Then: The header height is UITableView.automaticDimension
        XCTAssertEqual(headerHeight, UITableView.automaticDimension)
    }
    
    func testHeaderHeightDetail() {
        // Given: A mock detail group
        let mockGroup = Mocks.detailHeaderGroup
        
        // When: The header height is mapped
        let headerHeight = ScenarioThreeTableFactory().headerHeight(for: mockGroup)
        
        // Then: The header height is UITableView.automaticDimension
        XCTAssertEqual(headerHeight, UITableView.automaticDimension)
    }
    
    func testHeaderHeightMoreDetail() {
        // Given: A mock more detail group
        let mockGroup = Mocks.moreDetailHeaderGroup
        
        // When: The header height is mapped
        let headerHeight = ScenarioThreeTableFactory().headerHeight(for: mockGroup)
        
        // Then: The header height is 0
        XCTAssertEqual(headerHeight, 35)
    }
}

fileprivate class Mocks {
    static let infoItem = ScenarioThreeItem(title: "Detail", cost: "R5000", type: .info)
    static let descriptionItem = ScenarioThreeItem(title: "Summary", cost: "R5000", type: .description)
    static let nilItem: ScenarioThreeItem? = nil
    
    static let summaryHeaderGroup = ScenarioThreeGroup(type: .summary, title: "Summary", description: nil, items: [])
    static let detailHeaderGroup = ScenarioThreeGroup(type: .detail, title: "Detail", description: "Description", items: [])
    static let moreDetailHeaderGroup = ScenarioThreeGroup(type: .moreDetail, title: nil, description: nil, items: [])
    static let nilHeaderGroup: ScenarioThreeGroup? = nil
}
