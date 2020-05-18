//
//  TitleInfoTableViewCellTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class TitleInfoTableViewCellTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testCellConfigure() {
        // Given: a mock title, info, and indexPath
        let mockTitle = "Title"
        let mockInfo = "Info"
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: the cell is dequeued and configure is called
        let cell = mockTableView.dequeuedCell(ofType: TitleInfoTableViewCell.self, indexPath: mockIndexPath)
        cell.configure(title: mockTitle, info: mockInfo)
        
        // Then: the title and info values match the titleLabel and infoLabel text values
        XCTAssertEqual(cell.titleLabel.text, mockTitle)
        XCTAssertEqual(cell.infoLabel.text, mockInfo)
    }
}
