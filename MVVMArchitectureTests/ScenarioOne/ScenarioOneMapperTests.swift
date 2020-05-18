//
//  ScenarioOneMapperTests.swift
//  MVVMArchitectureTests
//
//  Created by Armand Kamffer on 2020/05/18.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import XCTest
@testable import MVVMArchitecture

class ScenarioOneMapperTests: XCTestCase {
    
    func testMapItems() {
        // Given: A mock ScenarioOneResponse that contains three items
        let mockResponse = Mocks.response
        
        // When: The items in the response are mapped
        let items = ScenarioOneMapper.mapItems(with: mockResponse)
        
        // Then: Three items should be mapped and the first should have specific mapped values
        XCTAssertEqual(items.count, 3)
        XCTAssertEqual(items.first?.title, "Test1")
        XCTAssert(items.first?.cost.count ?? 0 > 0, "Cost value not mapped to a currency value")
    }
    
    func testMapItemsEmptyResponse() {
        // Given: A mock ScenarioOneResponse that contains 0 items
        let mockResponse = Mocks.emptyResponse
        
        // When: The items in the response are mapped
        let items = ScenarioOneMapper.mapItems(with: mockResponse)
        
        // Then: An empty array with zero items
        XCTAssertEqual(items.count, 0)
    }
    
    func testMapItemsNilResponse() {
        // Given: A mock ScenarioOneResponse that is nil
        let mockResponse = Mocks.nilResponse
        
        // When: The items in the response are mapped
        let items = ScenarioOneMapper.mapItems(with: mockResponse)
        
        // Then: An empty array with zero items
        XCTAssertEqual(items.count, 0)
    }

}

fileprivate class Mocks {
    static let response = ScenarioOneResponse(items: [
        ScenarioOneItemResponse(title: "Test1", cost: 1000),
        ScenarioOneItemResponse(title: "Test2", cost: 2000),
        ScenarioOneItemResponse(title: "Test3", cost: 3000)
    ])
    
    static let emptyResponse = ScenarioOneResponse(items: [])
    
    static let nilResponse: ScenarioOneResponse? = nil
}
