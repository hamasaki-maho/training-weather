//
//  Model.swift
//  
//
//  Created by hamasaki.maho on 2025/11/06.
//

import Foundation

struct City: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var weathers: [Weather]
}


struct Weather: Codable, Hashable, Identifiable {
    var id:String
    var date: String
    var weather: weather
    var image: String
    
    enum weather: String, CodingKey, CaseIterable {
        case sun = "晴れ"
        case cloud = "曇り"
        case rain = "雨"
        
        var id: String {
            rawValue
        }
    }
}


