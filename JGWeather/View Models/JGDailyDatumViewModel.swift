//
//  JGDailyViewModel.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import Foundation

class JGDailyDatumViewModel {
    
    var dailyDatum: JGDailyDatum
    
    init(dailyDatum: JGDailyDatum) {
        self.dailyDatum = dailyDatum
    }
    
    var timeAsDayText: String {
        guard let time = dailyDatum.time else {
            return ""
        }
        let timeInterval: TimeInterval = TimeInterval(time)
        let timeAsDate: Date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter: DateFormatter = DateFormatter()
         dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: timeAsDate)
    }
    
    var temperatureHighText: String {
        guard let temperatureHigh = dailyDatum.temperatureHigh else {
            return ""
        }
        let celsiusDouble: Double = (temperatureHigh - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    var temperatureLowText: String {
        guard let temperatureLow = dailyDatum.temperatureLow else {
            return ""
        }
        let celsiusDouble: Double = (temperatureLow - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    var iconText: String {
        guard let icon = dailyDatum.icon else {
            return ""
        }
        return icon
    }
    
    var precipProbabilityText: String {
        guard let precipProbability = dailyDatum.precipProbability else {
            return ""
        }
        let probability: Double = (precipProbability * 100)
        return "\(Int(probability))%"
    }
    
}
