//
//  TitleHeaderViewTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class TitleHeaderViewTests: XCTestCase {
    func testHeaderConfigure() {
        // Given: a mock title
        let mockTitle = "Title"
        
        // When: the header is created and configure is called
        let header = TitleHeaderView.headerView()
        header?.configure(title: mockTitle)
        
        // Then: the title values match the titleLabel text values
        XCTAssertEqual(header?.titleLabel.text, mockTitle)
    }
}
