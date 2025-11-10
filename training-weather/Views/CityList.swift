//
//  CityList.swift
//  training-weather
//
//  Created by direct_975 on 2025/11/07.
//

import SwiftUI

struct CityList: View {
    @Environment(Model.self) var model
    @State private var showFavoriteOnly: Bool = false
    @State private var searchText: String = ""
    
    var filteredCities: [City] {
        model.cities.filter {city in
            (searchText.isEmpty || city.name.contains(searchText)) &&
            (!showFavoriteOnly || city.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorite")
                }
                ForEach(filteredCities) { city in
                    CityRow(city: city)
                    
                }
            }.navigationTitle("Select City")
                .searchable(text: $searchText, prompt: "都市を検索")
        } detail: {
            Text("Select City")
        }

    }
}

#Preview {
    CityList()
        .environment(Model())
}
