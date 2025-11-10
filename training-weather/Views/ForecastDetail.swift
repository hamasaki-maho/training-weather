//
//  ForecastDetail.swift
//  training-weather
//
//  Created by direct_975 on 2025/11/07.
//

import SwiftUI

import WebKit

struct ForecastDetail: View {
    @Environment(Model.self) var model
    
    var cityId : String
    @State private var weatherForecast: WeatherForecast?
    
    var body: some View {
        Text("City")
        ZStack {
            
            if weatherForecast == nil {
                ProgressView()
                    .scaleEffect(1.8)
                    .zIndex(100)
            }
            List {
                ForEach(weatherForecast?.forecasts ?? []) { forecast in
                    HStack {
                        Text(forecast.date)
                        
                        Spacer(minLength: 120)
                        
                        HStack {
                            SVGWebView(url: forecast.image.url)
                                .frame(width: 20)
                            Text(forecast.telop)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.task {
                do {
                    weatherForecast = try await getForecast(cityId: cityId)
                } catch {
                    print(error)
                }
            }
            .scrollContentBackground(weatherForecast == nil ? .hidden : .visible)
            .background(Color(.systemGroupedBackground))
            .refreshable {
                do {
                    weatherForecast = try await getForecast(cityId: cityId)
                } catch {
                    
                }
            }
        }

    }
}


struct SVGWebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView { WKWebView() }
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
}

#Preview {
    ForecastDetail(cityId: Model().mockWeatherForecast.forecasts.first!.id)
        .environment(Model())
}
