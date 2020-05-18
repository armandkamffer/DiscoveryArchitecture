//
//  TitleDescriptionTableViewCellTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class TitleDescriptionTableViewCellTests: XCTestCase {
    var mockTableView: UITableView!
    
    override func setUp() {
        super.setUp()
        mockTableView = UITableView()
    }
    
    func testCellConfigure() {
        // Given: a mock title, description, and indexPath
        let mockTitle = "Title"
        let mockDescription = "Description"
        let mockIndexPath = IndexPath(row: 0, section: 0)
        
        // When: the cell is dequeued and configure is called
        let cell = mockTableView.dequeuedCell(ofType: TitleDescriptionTableViewCell.self, indexPath: mockIndexPath)
        cell.configure(title: mockTitle, description: mockDescription)
        
        // Then: the title and description values match the titleLabel and descriptionLabel text values
        XCTAssertEqual(cell.titleLabel.text, mockTitle)
        XCTAssertEqual(cell.descriptionLabel.text, mockDescription)
    }
}
