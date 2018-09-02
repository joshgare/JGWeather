//
//  JGDailyDatumViewModelTests.swift
//  JGWeatherTests
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import XCTest
@testable import JGWeather

class JGDailyDatumViewModelTests: XCTestCase {
    
    var dailyDatumViewModel: JGDailyDatumViewModel?
    
    override func setUp() {
        super.setUp()
        
        // Load staic forecast data and initiate the view model
        let bundle: Bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "forecast", ofType: "json") else { return }
        let url: URL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url, options: .uncached) else { return }
        guard let forecast = try? newJSONDecoder().decode(JGForecast.self, from: data) else { return }
        guard let dailyDatum = forecast.daily?.data?.first else { return }
        self.dailyDatumViewModel = JGDailyDatumViewModel(dailyDatum: dailyDatum)
    }
    
    func testDailyDatumViewModel() {
        guard let dailyDatumViewModel = dailyDatumViewModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dailyDatumViewModel.timeAsDayText, "Monday")
        XCTAssertEqual(dailyDatumViewModel.temperatureHighText, "18°")
        XCTAssertEqual(dailyDatumViewModel.temperatureLowText, "11°")
        XCTAssertEqual(dailyDatumViewModel.iconText, "partly-cloudy-day")
        XCTAssertEqual(dailyDatumViewModel.precipProbabilityText, "5%")
    }
    
}
