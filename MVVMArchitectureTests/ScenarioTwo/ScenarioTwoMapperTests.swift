//
//  ScenarioTwoMapperTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioTwoMapperTests: XCTestCase {
    func testMapGroupsValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The groups are mapped
        let groups = ScenarioTwoMapper.mapGroups(with: mockResponse)
        
        // Then: Two groups are mapped
        XCTAssertEqual(groups.count, 2)
    }
    
    func testMapGroupsEmptyData() {
        // Given: A mock response with no detail items
        let mockResponse = Mocks.emptyResponse
        
        // When: The groups are mapped
        let groups = ScenarioTwoMapper.mapGroups(with: mockResponse)
        
        // Then: One groups are mapped
        XCTAssertEqual(groups.count, 1)
    }
    
    func testMapGroupsNilData() {
        // Given: A mock response that is nil
        let mockResponse = Mocks.nilResponse
        
        // When: The groups are mapped
        let groups = ScenarioTwoMapper.mapGroups(with: mockResponse)
        
        // Then: Zero groups are mapped
        XCTAssertEqual(groups.count, 0)
    }
    
    func testMapSummaryGroupValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The summary group is mapped
        let group = ScenarioTwoMapper.mapSummaryGroup(with: mockResponse)
        
        // Then: One item should be mapped and it should have specific mapped values
        XCTAssertEqual(group?.items.count, 1)
        XCTAssertEqual(group?.items.first?.title, "All benefits")
        XCTAssert(group?.items.first?.cost.count ?? 0 > 1, "Cost value not mapped to a currency value")
        XCTAssertEqual(group?.items.first?.cost.first, "R")
    }
    
    func testMapSummaryGroupEmptyData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.emptyResponse
        
        // When: The summary group is mapped
        let group = ScenarioTwoMapper.mapSummaryGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertNil(group)
    }
    
    func testMapDetailGroupValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The detail group is mapped
        let group = ScenarioTwoMapper.mapDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.items.count, 3)
        XCTAssertEqual(group.items.first?.title, "Test1")
        XCTAssert(group.items.first?.cost.count ?? 0 > 1, "Cost value not mapped to a currency value")
        XCTAssertEqual(group.items.first?.cost.first, "R")
    }
    
    func testMapDetailGroupEmptyData() {
        // Given: A mock response with no data
        let mockResponse = Mocks.emptyResponse
        
        // When: The detail group is mapped
        let group = ScenarioTwoMapper.mapDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.items.count, 0)
    }
}

fileprivate class Mocks {
    static let response = ScenarioTwoResponse(totalCost: 1000, detail: [
        ScenarioTwoDetailResponse(title: "Test1", cost: 1000),
        ScenarioTwoDetailResponse(title: "Test2", cost: 2000),
        ScenarioTwoDetailResponse(title: "Test3", cost: 3000)
    ])
    
    static let emptyResponse = ScenarioTwoResponse(totalCost: nil, detail: [])
    
    static let nilResponse: ScenarioTwoResponse? = nil
}
