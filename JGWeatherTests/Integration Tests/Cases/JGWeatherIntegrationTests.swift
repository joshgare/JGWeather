//
//  JGWeatherIntegrationTests.swift
//  JGWeatherTests
//
//  Created by Joshua Gare on 31/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import XCTest
@testable import JGWeather

import CoreLocation

class JGWeatherIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testRetrieveForecastWithSpecifiedLocation() {
        let expectation: XCTestExpectation = self.expectation(description: "Expected to load forecast data for the specified location.")
        
        APIClient.shared.retrieveForecast(with: CLLocation(latitude: 51.5074, longitude: 0.1278)) { (success, forecast, error) in
            expectation.fulfill()
            guard let forecast = forecast else {
                XCTFail()
                return
            }
            
            XCTAssertTrue(success)
            XCTAssertNotNil(forecast.currently)
            XCTAssertNotNil(forecast.minutely)
            XCTAssertNotNil(forecast.hourly)
            XCTAssertNotNil(forecast.daily)
            XCTAssertNotNil(forecast.flags)
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
//    func testRetrieveForecastForCurrentLocation() {
//        let expectation: XCTestExpectation = self.expectation(description: "Expected to load forecast data for the current location.")
//        
//        APIClient.shared.retrieveForecastForCurrentLocation { (success, forecast, error) in
//            expectation.fulfill()
//            guard let forecast = forecast else {
//                XCTFail()
//                return
//            }
//            
//            XCTAssertTrue(success)
//            XCTAssertNotNil(forecast.currently)
//            XCTAssertNotNil(forecast.minutely)
//            XCTAssertNotNil(forecast.hourly)
//            XCTAssertNotNil(forecast.daily)
//            XCTAssertNotNil(forecast.flags)
//        }
//        
//        waitForExpectations(timeout: 15, handler: nil)
//    }
    
}
