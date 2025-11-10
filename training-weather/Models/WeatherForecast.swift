//
//  WeatherForecast.swift
//  training-weather
//
//  Created by direct_975 on 2025/11/07.
//

import Foundation

struct WeatherForecast: Codable, Hashable {
    var forecasts : [Forecast]
}

struct Forecast: Codable, Identifiable, Hashable {
    var date: String
    var telop:String
    var image:ForecastImage
    
    var id : String{
        date
    }
}

struct ForecastImage: Codable, Hashable {
    var url:URL
}
