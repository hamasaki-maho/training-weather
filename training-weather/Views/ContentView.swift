//
//  ContentView.swift
//  training-weather
//
//  Created by hamasaki.maho on 2025/11/06.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        CityList()
    }
}

#Preview {
    ContentView()
        .environment(Model())
}
