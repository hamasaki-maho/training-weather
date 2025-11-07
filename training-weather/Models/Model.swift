//
//  Model.swift
//  
//
//  Created by hamasaki.maho on 2025/11/06.
//

import Foundation

@Observable
class Model {
    var cities: [City] = load("cities.json")
    var mockWeatherForecast: WeatherForecast = load("mockWeatherForecasts.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could'nt find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could'nt load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could'nt decode \(filename) as \(T.self):\n\(error)")
    }
}
