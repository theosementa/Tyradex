//
//  PokemonDetailView.swift
//  Tyradex
//
//  Created by KaayZenn on 27/07/2024.
//

import SwiftUI
import TyradexKit

struct PokemonDetailView: View {
    
    // Builder
    var pokemon: Pokemon
    
    // MARK: -
    var body: some View {
        ScrollView {
        }
        .scrollIndicators(.hidden)
        .navigationTitle(pokemon.nameLocalized)
        .navigationBarTitleDisplayMode(.inline)
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    PokemonDetailView(pokemon: .preview)
}
