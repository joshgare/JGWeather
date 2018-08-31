//
//  JGForecast.swift
//  JGWeather
//
//  Created by Joshua Gare on 30/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let jGForecast = try? newJSONDecoder().decode(JGForecast.self, from: jsonData)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseJGForecast { response in
//     if let jGForecast = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

struct JGForecast: Codable {
    let latitude: Double?
    let longitude: Double?
    let timezone: String?
    let currently: JGCurrently?
    let minutely: JGMinutely?
    let hourly: JGHourly?
    let daily: JGDaily?
    let flags: JGFlags?
    let offset: Int?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case timezone = "timezone"
        case currently = "currently"
        case minutely = "minutely"
        case hourly = "hourly"
        case daily = "daily"
        case flags = "flags"
        case offset = "offset"
    }
}

struct JGCurrently: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let nearestStormDistance: Int?
    let nearestStormBearing: Int?
    let precipIntensity: Double?
    let precipProbability: Double?
    let temperature: Double?
    let apparentTemperature: Double?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let visibility: Double?
    let ozone: Double?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case summary = "summary"
        case icon = "icon"
        case nearestStormDistance = "nearestStormDistance"
        case nearestStormBearing = "nearestStormBearing"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
        case temperature = "temperature"
        case apparentTemperature = "apparentTemperature"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windGust = "windGust"
        case windBearing = "windBearing"
        case cloudCover = "cloudCover"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case ozone = "ozone"
    }
}

struct JGDaily: Codable {
    let summary: String?
    let icon: String?
    let data: [JGDailyDatum]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct JGDailyDatum: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let sunriseTime: Int?
    let sunsetTime: Int?
    let moonPhase: Double?
    let precipIntensity: Double?
    let precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let precipType: String?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windGustTime: Int?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let uvIndexTime: Int?
    let visibility: Double?
    let ozone: Double?
    let temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case summary = "summary"
        case icon = "icon"
        case sunriseTime = "sunriseTime"
        case sunsetTime = "sunsetTime"
        case moonPhase = "moonPhase"
        case precipIntensity = "precipIntensity"
        case precipIntensityMax = "precipIntensityMax"
        case precipIntensityMaxTime = "precipIntensityMaxTime"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case temperatureHigh = "temperatureHigh"
        case temperatureHighTime = "temperatureHighTime"
        case temperatureLow = "temperatureLow"
        case temperatureLowTime = "temperatureLowTime"
        case apparentTemperatureHigh = "apparentTemperatureHigh"
        case apparentTemperatureHighTime = "apparentTemperatureHighTime"
        case apparentTemperatureLow = "apparentTemperatureLow"
        case apparentTemperatureLowTime = "apparentTemperatureLowTime"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windGust = "windGust"
        case windGustTime = "windGustTime"
        case windBearing = "windBearing"
        case cloudCover = "cloudCover"
        case uvIndex = "uvIndex"
        case uvIndexTime = "uvIndexTime"
        case visibility = "visibility"
        case ozone = "ozone"
        case temperatureMin = "temperatureMin"
        case temperatureMinTime = "temperatureMinTime"
        case temperatureMax = "temperatureMax"
        case temperatureMaxTime = "temperatureMaxTime"
        case apparentTemperatureMin = "apparentTemperatureMin"
        case apparentTemperatureMinTime = "apparentTemperatureMinTime"
        case apparentTemperatureMax = "apparentTemperatureMax"
        case apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
    }
}

struct JGFlags: Codable {
    let sources: [String]?
    let units: String?
    
    enum CodingKeys: String, CodingKey {
        case sources = "sources"
        case units = "units"
    }
}

struct JGHourly: Codable {
    let summary: String?
    let icon: String?
    let data: [JGCurrently]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct JGMinutely: Codable {
    let summary: String?
    let icon: String?
    let data: [JGMinutelyDatum]?
    
    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case icon = "icon"
        case data = "data"
    }
}

struct JGMinutelyDatum: Codable {
    let time: Int?
    let precipIntensity: Int?
    let precipProbability: Int?
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseJGForecast(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<JGForecast>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

