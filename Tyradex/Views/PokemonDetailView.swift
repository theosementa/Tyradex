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
                AsyncImage(url: viewModel.selectedSprite) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .if(viewModel.selectedSprite != nil) { view in
                            view
                                .matchedGeometryEffect(id: viewModel.selectedSprite!, in: animation, isSource: true)
                        }
                } placeholder: {
                    Color.clear
                        .frame(width: 300, height: 300)
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(width: 300, height: 300)
                
                HStack {
                    ForEach(viewModel.spritesURLs, id: \.self) { sprite in
                        SpriteRow(
                            sprite: sprite,
                            selectedSprite: $viewModel.selectedSprite,
                            nextSelectedSprite: $viewModel.nextSelectedSprite,
                            animation: animation
                        )
                    }
                }
            }
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


extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
