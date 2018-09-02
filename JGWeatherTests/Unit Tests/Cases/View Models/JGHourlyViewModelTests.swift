//
//  JGHourlyViewModelTests.swift
//  JGWeatherTests
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import XCTest
@testable import JGWeather

class JGHourlyViewModelTests: XCTestCase {
    
    var hourlyViewModel: JGHourlyViewModel?
    
    override func setUp() {
        super.setUp()
        
        // Load staic forecast data and initiate the view model
        let bundle: Bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "forecast", ofType: "json") else { return }
        let url: URL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url, options: .uncached) else { return }
        guard let forecast = try? newJSONDecoder().decode(JGForecast.self, from: data) else { return }
        guard let hourly = forecast.hourly else { return }
        self.hourlyViewModel = JGHourlyViewModel(hourly: hourly)
    }
    
    func testJGHourlyViewModel() {
        // Ensure static forecast data and the view model has loaded correctly
        guard let hourlyViewModel = hourlyViewModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(hourlyViewModel.hourlyDataArray.count, 24)
    }
    
}
