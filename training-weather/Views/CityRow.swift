//
//  CityRow.swift
//  training-weather
//
//  Created by shimada.takahito on 2025/11/10.
//

import SwiftUI

struct CityRow: View {
    @Environment(Model.self) var model
    var city: City
    var cityIndex: Int {
        model.cities.firstIndex(where: {
            $0.id == city.id
        })!
    }

    var body: some View {
        @Bindable var model = model
        NavigationLink {
            ForecastDetail(cityId: city.id)
        } label: {
            HStack {
                FavoriteButton(isSet: $model.cities[cityIndex].isFavorite)
                Text(city.name)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    CityRow(city: Model().cities.first!)
        .environment(Model())
}
