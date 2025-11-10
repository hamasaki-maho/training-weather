//
//  FavoriteButton.swift
//  training-weather
//
//  Created by wakai.sho on 2025/11/10.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button{isSet.toggle()} label: {
            Label("favorite", systemImage: isSet ? "star.fill" : "star").labelStyle(.iconOnly).foregroundStyle(isSet ? .yellow : .gray)
        }.buttonStyle(.plain)
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
