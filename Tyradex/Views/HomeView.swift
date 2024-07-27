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
    @EnvironmentObject private var router: NavigationManager
    @EnvironmentObject private var pokemonRepo: PokemonRepository
    
    // MARK: -
    var body: some View {
        List(pokemonRepo.pokemons) { pokemon in
            Button(action: { router.pushDetail(pokemon: pokemon) }, label: {
                PokemonRow(pokemon: pokemon)
            })
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .navigationTitle("Tyradex")
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    HomeView()
        .environmentObject(PokemonRepository.shared)
}
