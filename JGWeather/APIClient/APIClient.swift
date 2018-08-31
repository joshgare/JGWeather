//
//  APIClient.swift
//  JGWeather
//
//  Created by Joshua Gare on 31/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class APIClient {
    
    // Singleton setup
    static var shared: APIClient = APIClient()
    
    // Global variables
    private var serverUrl: String = "https://api.darksky.net/forecast"
    private var apiKey: String = "bdedc120084b8862558aeb732a44510c" // Please note this key may expire / be suspened and you can generate a new key at https://darksky.net/dev
    
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

}

enum APIError: Error {
    case unkownError
}
