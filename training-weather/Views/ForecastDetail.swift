//
//  ForecastDetail.swift
//  training-weather
//
//  Created by direct_975 on 2025/11/07.
//

import SwiftUI

struct ForecastDetail: View {
    @Environment(Model.self) var model
    
    var body: some View {
        List {
            ForEach(model.mockWeatherForecast.forecasts) { forecast in
                HStack {
                    Text(forecast.date)
                    Spacer()
                    AsyncImage(url: URL(string: "https://example.com/icon.png"))
                        .frame(width: 200, height: 200)
                    
                    Text(forecast.image.url)
//                    AsyncImage(url: URL(string: forecast.image.url))
//                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    ForecastDetail()
        .environment(Model())
}
