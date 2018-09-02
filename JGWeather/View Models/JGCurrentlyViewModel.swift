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
    
    var temperatureText: String {
        guard let temperature = currently.temperature else {
            return ""
        }
        let celsiusDouble: Double = (temperature - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    var iconText: String {
        guard let icon = currently.icon else {
            return ""
        }
        return icon
    }
    
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
    
    var summaryText: String {
        guard let summary = currently.summary else {
            return ""
        }
        return summary
    }
    
    var precipProbabilityText: String {
        guard let precipProbability = currently.precipProbability else {
            return ""
        }
        return "\(Int(precipProbability * 100))%"
    }
    
    var windspeedText: String {
        guard let windspeed = currently.windSpeed else {
            return ""
        }
        return "\(windspeed)mph"
    }
    
    public var cloudCoverText: String {
        guard let cloudCover = currently.cloudCover else {
            return ""
        }
        return "\(Int(cloudCover * 100))%"
    }
    
    public var humidityText: String {
        guard let humidity = currently.humidity else {
            return ""
        }
        return "\(Int(humidity * 100))%"
    }
    
}
