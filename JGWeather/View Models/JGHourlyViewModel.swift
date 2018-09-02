//
//  JGHourlyViewModel.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import Foundation

class JGHourlyViewModel {
    
    var hourly: JGHourly
    
    init(hourly: JGHourly) {
        self.hourly = hourly
    }
    
    var hourlyDataArray: [JGCurrently] {
        guard let hourlyDataArray = hourly.data else {
            return []
        }
        var filteredHourlyDataArray: [JGCurrently] = []
        for currently in hourlyDataArray {
            filteredHourlyDataArray.append(currently)
            // Limit hourly forecasts to 24 hours for UX reasons
            if (filteredHourlyDataArray.count > 23) {
                break
            }
        }
        return filteredHourlyDataArray
    }
    
}
