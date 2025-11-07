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
            Text("Select City")
                .bold()
            List {
                ForEach(model.cities) { city in
                    
                    NavigationLink {
                        ForecastDetail()
                    } label: {
                        HStack {
                            Text(city.name)
                        }
                    }
                }
            }
        } detail: {
            Text("Select City")
        }

    }
}

#Preview {
    CityList()
        .environment(Model())
}
