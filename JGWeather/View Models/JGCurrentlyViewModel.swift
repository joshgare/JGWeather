//
//  JGCurrentlyViewModel.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import Foundation

class JGCurrentlyViewModel {
    
    var currently: JGCurrently
    
    init(currently: JGCurrently) {
        self.currently = currently
    }
    
    /**
     Converts the temperarture from fahrenheit to celsius.
     
     - Returns: The temperature in celsisus as a String.
     */
    var temperatureText: String {
        guard let temperature = currently.temperature else {
            return ""
        }
        let celsiusDouble: Double = (temperature - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    /**
     - Returns: The icon type as a String.
     */
    var iconText: String {
        guard let icon = currently.icon else {
            return ""
        }
        return icon
    }
    
    /**
     Converts a timestamp to an hour with AM or PM.
     
     - Returns: The hour with AM/PM as a String.
     */
    var timeAsHourText: String {
        guard let time = currently.time else {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(time)
        let timeAsDate: Date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: timeAsDate)
    }
    
    /**
     - Returns: The weather summary as a String.
     */
    var summaryText: String {
        guard let summary = currently.summary else {
            return ""
        }
        return summary
    }
    
    /**
     Converts a decimal probability of the precipitation likelihood to a percentage.
     
     - Returns: The probability of precipitation in percentage form as a String.
     */
    var precipProbabilityText: String {
        guard let precipProbability = currently.precipProbability else {
            return ""
        }
        return "\(Int(precipProbability * 100))%"
    }
    
    /**
     - Returns: The windspeed in mph as a String.
     */
    var windspeedText: String {
        guard let windspeed = currently.windSpeed else {
            return ""
        }
        return "\(windspeed)mph"
    }
    
    /**
     Converts the cloud coverage decimal to a percentage.
     
     - Returns: The cloud coverage in percentage form as a String.
     */
    public var cloudCoverText: String {
        guard let cloudCover = currently.cloudCover else {
            return ""
        }
        return "\(Int(cloudCover * 100))%"
    }
    
    /**
     Converts the humidity decimal to a percentage.
     
     - Returns: The humidity in percentage form as a String.
     */
    public var humidityText: String {
        guard let humidity = currently.humidity else {
            return ""
        }
        return "\(Int(humidity * 100))%"
    }
    
}
