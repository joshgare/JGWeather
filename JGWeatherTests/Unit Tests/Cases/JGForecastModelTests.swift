//
//  JGForecastModelTests.swift
//  JGWeatherTests
//
//  Created by Joshua Gare on 31/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import XCTest
@testable import JGWeather

class JGForecastModelTests: XCTestCase {
    
    var forecast: JGForecast?
    
    override func setUp() {
        super.setUp()
        
        // Load staic forecast data
        let bundle: Bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "forecast", ofType: "json") else { return }
        let url: URL = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url, options: .uncached) else { return }
        guard let forecast = try? newJSONDecoder().decode(JGForecast.self, from: data) else { return }
        self.forecast = forecast
    }
    
    func testJGForecast() {
        // Ensure static forecast data has loaded correctly
        guard let forecast = forecast else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(forecast.latitude, 37.8267)
        XCTAssertEqual(forecast.longitude, -122.4233)
        XCTAssertEqual(forecast.timezone, "America/Los_Angeles")
        XCTAssertEqual(forecast.offset, -8)
    }
    
    func testJGCurrently() {
        // Ensure static forecast data has loaded correctly
        guard let currently = forecast?.currently else {
            XCTFail()
            return
        }

        XCTAssertEqual(currently.time, 1512990200)
        XCTAssertEqual(currently.summary, "Clear")
        XCTAssertEqual(currently.icon, "clear-night")
        XCTAssertEqual(currently.nearestStormDistance, 658)
        XCTAssertEqual(currently.nearestStormBearing, 116)
        XCTAssertEqual(currently.precipIntensity, 0)
        XCTAssertEqual(currently.precipProbability, 0)
        XCTAssertEqual(currently.temperature, 48.5)
        XCTAssertEqual(currently.apparentTemperature, 48.5)
        XCTAssertEqual(currently.dewPoint, 35.24)
        XCTAssertEqual(currently.humidity, 0.6)
        XCTAssertEqual(currently.pressure, 1024.75)
        XCTAssertEqual(currently.windSpeed, 2.95)
        XCTAssertEqual(currently.windGust, 6.44)
        XCTAssertEqual(currently.windBearing, 41)
        XCTAssertEqual(currently.cloudCover, 0.06)
        XCTAssertEqual(currently.uvIndex, 0)
        XCTAssertEqual(currently.visibility, 10)
        XCTAssertEqual(currently.ozone, 289.77)
    }
    
    func testJGMinutely() {
        // Ensure static forecast data has loaded correctly
        guard let minutely = forecast?.minutely else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(minutely.summary, "Clear for the hour.")
        XCTAssertEqual(minutely.icon, "clear-night")
        XCTAssertNotNil(minutely.data)
    }
    
    func testJGMinutelyDatum() {
        // Ensure static forecast data has loaded correctly
        guard let minutelyDatum = forecast?.minutely?.data?.first else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(minutelyDatum.time, 1512990180)
        XCTAssertEqual(minutelyDatum.precipIntensity, 0)
        XCTAssertEqual(minutelyDatum.precipProbability, 0)
    }
    
    func testJGHourly() {
        // Ensure static forecast data has loaded correctly
        guard let hourly = forecast?.hourly else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(hourly.summary, "Partly cloudy starting tomorrow morning, continuing until tomorrow afternoon.")
        XCTAssertEqual(hourly.icon, "partly-cloudy-day")
        XCTAssertNotNil(hourly.data)
    }
    
    func testJGDaily() {
        // Ensure static forecast data has loaded correctly
        guard let daily = forecast?.daily else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(daily.summary, "No precipitation throughout the week, with temperatures bottoming out at 63°F on Wednesday.")
        XCTAssertEqual(daily.icon, "clear-day")
        XCTAssertNotNil(daily.data)
    }
    
    func testJGDailyDatum() {
        // Ensure static forecast data has loaded correctly
        guard let dailyDatum = forecast?.daily?.data?.first else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(dailyDatum.time, 1512979200)
        XCTAssertEqual(dailyDatum.time, 1512979200)
        XCTAssertEqual(dailyDatum.summary, "Partly cloudy until afternoon.")
        XCTAssertEqual(dailyDatum.icon, "partly-cloudy-day")
        XCTAssertEqual(dailyDatum.sunriseTime, 1513005410)
        XCTAssertEqual(dailyDatum.sunsetTime, 1513039936)
        XCTAssertEqual(dailyDatum.moonPhase, 0.8)
        XCTAssertEqual(dailyDatum.precipIntensity, 0.0001)
        XCTAssertEqual(dailyDatum.precipIntensityMax, 0.0002)
        XCTAssertEqual(dailyDatum.precipIntensityMaxTime, 1513008000)
        XCTAssertEqual(dailyDatum.precipProbability, 0.05)
        XCTAssertEqual(dailyDatum.precipType, "rain")
        XCTAssertEqual(dailyDatum.temperatureHigh, 64.52)
        XCTAssertEqual(dailyDatum.temperatureHighTime, 1513033200)
        XCTAssertEqual(dailyDatum.temperatureLow, 51.45)
        XCTAssertEqual(dailyDatum.temperatureLowTime, 1513090800)
        XCTAssertEqual(dailyDatum.apparentTemperatureHigh, 64.52)
        XCTAssertEqual(dailyDatum.apparentTemperatureHighTime, 1513033200)
        XCTAssertEqual(dailyDatum.apparentTemperatureLow, 51.45)
        XCTAssertEqual(dailyDatum.apparentTemperatureLowTime, 1513090800)
        XCTAssertEqual(dailyDatum.dewPoint, 36.22)
        XCTAssertEqual(dailyDatum.humidity, 0.49)
        XCTAssertEqual(dailyDatum.pressure, 1025.34)
        XCTAssertEqual(dailyDatum.windSpeed, 6.47)
        XCTAssertEqual(dailyDatum.windGust, 16.47)
        XCTAssertEqual(dailyDatum.windGustTime, 1513015200)
        XCTAssertEqual(dailyDatum.windBearing, 51)
        XCTAssertEqual(dailyDatum.cloudCover, 0.17)
        XCTAssertEqual(dailyDatum.uvIndex, 2)
        XCTAssertEqual(dailyDatum.uvIndexTime, 1513022400)
        XCTAssertEqual(dailyDatum.visibility, 10)
        XCTAssertEqual(dailyDatum.ozone, 294.42)
        XCTAssertEqual(dailyDatum.temperatureMin, 47.13)
        XCTAssertEqual(dailyDatum.temperatureMinTime, 1512986400)
        XCTAssertEqual(dailyDatum.temperatureMax, 64.52)
        XCTAssertEqual(dailyDatum.temperatureMaxTime, 1513033200)
        XCTAssertEqual(dailyDatum.apparentTemperatureMin, 47.13)
        XCTAssertEqual(dailyDatum.apparentTemperatureMinTime, 1512986400)
        XCTAssertEqual(dailyDatum.apparentTemperatureMax, 64.52)
        XCTAssertEqual(dailyDatum.apparentTemperatureMaxTime, 1513033200)
    }
    
    func testJGFlags() {
        // Ensure static forecast data has loaded correctly
        guard let flags = forecast?.flags else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(flags.sources)
        XCTAssertEqual(flags.sources?.count, 10)
        XCTAssertEqual(flags.units, "us")
    }
    
}
