//
//  TitleDescriptionHeaderViewTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class TitleDescriptionHeaderViewTests: XCTestCase {
    func testHeaderConfigure() {
        // Given: a mock title and description
        let mockTitle = "Title"
        let mockDescription = "Description"
        
        // When: the header is created and configure is called
        let header = TitleDescriptionHeaderView.headerView()
        header?.configure(title: mockTitle, description: mockDescription)
        
        // Then: the title, description values match the titleLabel, descriptionLabel text values
        XCTAssertEqual(header?.titleLabel.text, mockTitle)
        XCTAssertEqual(header?.descriptionLabel.text, mockDescription)
    }
}
