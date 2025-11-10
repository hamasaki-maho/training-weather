//
//  CityList.swift
//  training-weather
//
//  Created by direct_975 on 2025/11/07.
//

import SwiftUI

struct CityList: View {
    @Environment(Model.self) var model
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(model.cities) { city in
                    
                    NavigationLink {
                        ForecastDetail(cityId: city.id)
                    } label: {
                        HStack {
                            Text(city.name)
                        }
                    }
                }
            }.navigationTitle("Select City")
        } detail: {
            Text("Select City")
                
        }

    }
}

#Preview {
    CityList()
        .environment(Model())
}
