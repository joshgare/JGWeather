//
//  APIClient.swift
//  JGWeather
//
//  Created by Joshua Gare on 31/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import Foundation
import Alamofire
import INTULocationManager

class APIClient {
    
    // Singleton setup
    static var shared: APIClient = APIClient()
    
    // Global variables
    private var serverUrl: String = "https://api.darksky.net/forecast"
    private var apiKey: String = "bdedc120084b8862558aeb732a44510c" // Please note this key may expire / be suspened and you can generate a new key at https://darksky.net/dev
    
    
    /**
     Retrieves the current forecast data for the specified location.
     
     - Returns: A new Forecast of the forecast data, a success bool and an error object.
     */
    func retrieveForecast(with location: CLLocation, completionHandler: @escaping (_ success: Bool, _ forecast: JGForecast?, _ error: Error?) -> Void) {
        Alamofire.request("\(serverUrl)/\(apiKey)/\(location.coordinate.latitude),\(location.coordinate.longitude)").responseJGForecast { response in
            if let error = response.error {
                completionHandler(false, nil, error)
            } else if let forecast = response.result.value {
               completionHandler(true, forecast, nil)
            } else {
                completionHandler(false, nil, APIError.unkownError)
            }
        }
    }
    
    /**
     Retrieves the current forecast data for the current location.
     
     - Returns: A new Forecast of the forecast data, a success bool and an error object.
     */
    func retrieveForecastForCurrentLocation(completionHandler: @escaping (_ success: Bool, _ forecast: JGForecast?, _ error: Error?) -> Void) {
        let locationManager: INTULocationManager = INTULocationManager.sharedInstance()
        locationManager.requestLocation(withDesiredAccuracy: .city, timeout: 10.0, delayUntilAuthorized: true) { (currentLocation, achievedAccuracy, status) in
            guard let currentLocation = currentLocation else {
                completionHandler(false, nil, APIError.unableToLocateUser)
                return
            }
            self.retrieveForecast(with: currentLocation, completionHandler: completionHandler)
        }
    }

}

enum APIError: Error {
    case unkownError
    case unableToLocateUser
}
