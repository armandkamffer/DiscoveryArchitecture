//
//  ScenarioThreeHeaderFactoryTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioThreeHeaderFactoryTests: XCTestCase {
    func testSummaryHeaderFactoryValidData() {
        // Given: A mock group with a title
        let mockGroup = Mocks.summaryHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeSummaryHeaderFactory().header(for: mockGroup)
        
        // Then: The header is of type TitleHeaderView
        XCTAssert(header?.isMember(of: TitleHeaderView.self) ?? false)
    }
    
    func testSummaryHeaderFactoryEmptyData() {
        // Given: A mock group without a title
        let mockGroup = Mocks.emptySummaryHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeSummaryHeaderFactory().header(for: mockGroup)
        
        // Then: No header is returned
        XCTAssertNil(header)
    }
    
    func testSummaryHeaderFactoryNilData() {
        // Given: A mock nil group
        let mockGroup = Mocks.nilHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeSummaryHeaderFactory().header(for: mockGroup)
        
        // Then: No header is returned
        XCTAssertNil(header)
    }
    
    func testDetailHeaderFactoryValidData() {
        // Given: A mock group with a title
        let mockGroup = Mocks.detailHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeDetailHeaderFactory().header(for: mockGroup)
        
        // Then: The header is of type TitleHeaderView
        XCTAssert(header?.isMember(of: TitleDescriptionHeaderView.self) ?? false)
    }
    
    func testDetailHeaderFactoryEmptyData() {
        // Given: A mock group without a title
        let mockGroup = Mocks.emptyDetailHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeDetailHeaderFactory().header(for: mockGroup)
        
        // Then: No header is returned
        XCTAssertNil(header)
    }
    
    func testDetailHeaderFactoryNilData() {
        // Given: A mock nil group
        let mockGroup = Mocks.nilHeaderGroup
        
        // When: A header view is created
        let header = ScenarioThreeDetailHeaderFactory().header(for: mockGroup)
        
        // Then: No header is returned
        XCTAssertNil(header)
    }
}

fileprivate class Mocks {
    static let summaryHeaderGroup = ScenarioThreeGroup(type: .summary, title: "Summary", description: nil, items: [])
    static let emptySummaryHeaderGroup = ScenarioThreeGroup(type: .summary, title: nil, description: nil, items: [])
    static let detailHeaderGroup = ScenarioThreeGroup(type: .detail, title: "Detail", description: "Description", items: [])
    static let emptyDetailHeaderGroup = ScenarioThreeGroup(type: .detail, title: nil, description: nil, items: [])
    static let nilHeaderGroup: ScenarioThreeGroup? = nil
}
