//
//  HomeView.swift
//  Tyradex
//
//  Created by KaayZenn on 27/07/2024.
//

import SwiftUI
import TyradexKit

struct HomeView: View {
    
    // EnvironmentObject
    @EnvironmentObject private var pokemonRepo: PokemonRepository
    
    // MARK: -
    var body: some View {
        List(pokemonRepo.pokemons) { pokemon in
            PokemonRow(pokemon: pokemon)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    HomeView()
        .environmentObject(PokemonRepository.shared)
}
