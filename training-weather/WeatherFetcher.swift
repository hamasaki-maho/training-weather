//
//  File.swift
//  training-weather
//
//  Created by shimada.takahito on 2025/11/07.
//

import Foundation

func getForecast(cityId:String) async throws -> WeatherForecast{
    guard let url = URL(string: "https://weather.tsukumijima.net/api/forecast/city/\(cityId)") else { throw URLError(.badURL)}
    
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{throw URLError(.badServerResponse)}
    
    let decoder = JSONDecoder()
    let result = try decoder.decode(WeatherForecast.self, from: data)
    
    return result
}

