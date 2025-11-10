//
//  CityRow.swift
//  training-weather
//
//  Created by shimada.takahito on 2025/11/10.
//

import SwiftUI

struct CityRow: View {
    var city: City
    
    var body: some View {
        NavigationLink {
            ForecastDetail(cityId: city.id)
        } label: {
            HStack {
                if city.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                } else{
                    Image(systemName: "star")
                }
                Text(city.name)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    CityRow(city: Model().cities.first!)
}
