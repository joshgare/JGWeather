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
    
}
