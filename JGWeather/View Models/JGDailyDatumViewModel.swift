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
    
    /**
     Converts a timestamp to a day of the week.
     
     - Returns: The day of the week as a String.
     */
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
    
    /**
     Converts the temperarture high from fahrenheit to celsius.
     
     - Returns: The temperature high in celsisus as a String.
     */
    var temperatureHighText: String {
        guard let temperatureHigh = dailyDatum.temperatureHigh else {
            return ""
        }
        let celsiusDouble: Double = (temperatureHigh - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    /**
     Converts the temperarture low from fahrenheit to celsius.
     
     - Returns: The temperature low in celsisus as a String.
     */
    var temperatureLowText: String {
        guard let temperatureLow = dailyDatum.temperatureLow else {
            return ""
        }
        let celsiusDouble: Double = (temperatureLow - 32.0) / 1.8
        return "\(Int(celsiusDouble.rounded()))°"
    }
    
    /**
     - Returns: The icon type as a String.
     */
    var iconText: String {
        guard let icon = dailyDatum.icon else {
            return ""
        }
        return icon
    }
    
    /**
     Converts a decimal probability of the precipitation likelihood to a percentage.
     
     - Returns: The probability of precipitation in percentage form as a String.
     */
    var precipProbabilityText: String {
        guard let precipProbability = dailyDatum.precipProbability else {
            return ""
        }
        let probability: Double = (precipProbability * 100)
        return "\(Int(probability))%"
    }
    
}
