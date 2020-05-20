//
//  ScenarioThreeMapperTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioThreeMapperTests: XCTestCase {
    func testMapGroupsValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The groups are mapped
        let groups = ScenarioThreeMapper.mapGroups(with: mockResponse)
        
        // Then: Three groups are mapped
        XCTAssertEqual(groups.count, 3)
    }
    
    func testMapGroupsEmptyData() {
        // Given: A mock response with no detail items
        let mockResponse = Mocks.emptyResponse
        
        // When: The groups are mapped
        let groups = ScenarioThreeMapper.mapGroups(with: mockResponse)
        
        // Then: Two groups are mapped
        XCTAssertEqual(groups.count, 2)
    }
    
    func testMapGroupsNilData() {
        // Given: A mock response that is nil
        let mockResponse = Mocks.nilResponse
        
        // When: The groups are mapped
        let groups = ScenarioThreeMapper.mapGroups(with: mockResponse)
        
        // Then: Zero groups are mapped
        XCTAssertEqual(groups.count, 0)
    }
    
    func testMapSummaryGroupValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The summary group is mapped
        let group = ScenarioThreeMapper.mapSummaryGroup(with: mockResponse)
        
        // Then: One item should be mapped and it should have specific mapped values
        XCTAssertEqual(group?.type, .summary)
        XCTAssertEqual(group?.title, "Summary")
        XCTAssertNil(group?.description)
        
        XCTAssertEqual(group?.items.count, 1)
        XCTAssertEqual(group?.items.first?.title, "All benefits")
        XCTAssertEqual(group?.items.first?.type, ScenarioThreeItemType.info)
        XCTAssert(group?.items.first?.cost.count ?? 0 > 1, "Cost value not mapped to a currency value")
        XCTAssertEqual(group?.items.first?.cost.first, "R")
    }
    
    func testMapSummaryGroupEmptyData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.emptyResponse
        
        // When: The summary group is mapped
        let group = ScenarioThreeMapper.mapSummaryGroup(with: mockResponse)
        
        // Then: The group should be nil
        XCTAssertNil(group)
    }
    
    func testMapDetailGroupValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The detail group is mapped
        let group = ScenarioThreeMapper.mapDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.type, .detail)
        XCTAssertEqual(group.title, "Detail")
        XCTAssertEqual(group.description, "The following is a breakdown of your benefit costs")
        
        XCTAssertEqual(group.items.count, 3)
        XCTAssertEqual(group.items.first?.title, "Test1")
        XCTAssertEqual(group.items.first?.type, ScenarioThreeItemType.description)
        XCTAssert(group.items.first?.cost.count ?? 0 > 1, "Cost value not mapped to a currency value")
        XCTAssertEqual(group.items.first?.cost.first, "R")
    }
    
    func testMapDetailGroupEmptyData() {
        // Given: A mock response with no data
        let mockResponse = Mocks.emptyResponse
        
        // When: The detail group is mapped
        let group = ScenarioThreeMapper.mapDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.items.count, 0)
    }
    
    func testMapMoreDetailGroupValidData() {
        // Given: A mock response with three detail items
        let mockResponse = Mocks.response
        
        // When: The detail group is mapped
        let group = ScenarioThreeMapper.mapMoreDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.type, .moreDetail)
        XCTAssertNil(group.title)
        XCTAssertNil(group.description)
        
        XCTAssertEqual(group.items.count, 3)
        XCTAssertEqual(group.items.first?.title, "Test1")
        XCTAssert(group.items.first?.cost.count ?? 0 > 1, "Cost value not mapped to a currency value")
        XCTAssertEqual(group.items.first?.cost.first, "R")
        XCTAssertEqual(group.items.element(at: 0)?.type, ScenarioThreeItemType.description)
        XCTAssertEqual(group.items.element(at: 1)?.type, ScenarioThreeItemType.info)
        XCTAssertEqual(group.items.element(at: 2)?.type, ScenarioThreeItemType.description)
    }
    
    func testMapMoreDetailGroupEmptyData() {
        // Given: A mock response with no data
        let mockResponse = Mocks.emptyResponse
        
        // When: The detail group is mapped
        let group = ScenarioThreeMapper.mapMoreDetailGroup(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(group.items.count, 0)
    }
}

fileprivate class Mocks {
    static let response = ScenarioThreeResponse(totalCost: 1000, detail: [
        ScenarioThreeDetailResponse(title: "Test1", cost: 1000),
        ScenarioThreeDetailResponse(title: "Test2", cost: 2000),
        ScenarioThreeDetailResponse(title: "Test3", cost: 3000)
    ])
    
    static let emptyResponse = ScenarioThreeResponse(totalCost: nil, detail: [])
    
    static let nilResponse: ScenarioThreeResponse? = nil
}
