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
    
    // ViewModel
    @StateObject private var viewModel: PokemonDetailViewModel = .init()
    
    @Namespace private var animation
    
    // MARK: -
    var body: some View {
        ScrollView {
            VStack {
                PokemonImage(
                    pokemon: pokemon,
                    selectedSprite: $viewModel.selectedSprite,
                    animation: animation
                )
                
                HStack {
                    ForEach(viewModel.spritesURLs, id: \.self) { sprite in
                        SpriteRow(
                            sprite: sprite,
                            selectedSprite: $viewModel.selectedSprite,
                            animation: animation
                        )
                    }
                }
            }
            .padding()
            
            StatisticsRow(pokemon: pokemon)
                .padding()
        } // End ScrollView
        .scrollIndicators(.hidden)
        .background(Color.Apple.background)
        .navigationTitle(pokemon.nameLocalized)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.spritesURLs = pokemon.spritesURLs
            viewModel.selectedSprite = pokemon.spritesURLs.first
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    NavigationStack {
        PokemonDetailView(pokemon: .preview)
    }
}
