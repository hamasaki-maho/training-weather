//
//  File.swift
//  training-weather
//
//  Created by shimada.takahito on 2025/11/07.
//

import Foundation

func getForecast(by id:String) async throws -> WeatherForecast{
    guard let url = URL(string: "https://weather.tsukumijima.net/api/forecast/city/\(id)") else { throw URLError(.badURL)}
    var request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request){ date,responce,error in
        if let error = error {
            throw URLError(.badServerResponse)
        }
        
        if let responce = responce as? HTTPURLResponse, responce.statusCode != 200 {
            
        }
    }
}
