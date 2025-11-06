//
//  ContentView.swift
//  training-weather
//
//  Created by hamasaki.maho on 2025/11/06.
//

import SwiftUI

struct ContentView: View {
    @Environment(Model.self) var model
    
    var body: some View {
        NavigationSplitView {
            Text("Select City")
                .bold()
            List {
                ForEach(model.cities) { city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                    
                }
            }
        } detail: {
            Text("Select City")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(Model())
}
