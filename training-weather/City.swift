//
//  Model.swift
//  
//
//  Created by hamasaki.maho on 2025/11/06.
//

import Foundation

struct City: Codable, Identifiable, Hashable {
    var id:String
    var name: String
}

struct WeatherForcast: Codable, Hashable {
    var forcasts : [Forcast]
}

struct Forcast: Codable, Identifiable, Hashable {
    var date: String
    var telop:String
    var image:Image
    
    var id : String{
        date
    }
}

struct Image: Codable, Hashable {
    var url:String
}


