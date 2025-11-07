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
    
    var body: some View {
        Text("City")
        List {
            ForEach(model.mockWeatherForecast.forecasts) { forecast in
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
    ForecastDetail()
        .environment(Model())
}
