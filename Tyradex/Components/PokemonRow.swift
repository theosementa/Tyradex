//
//  PokemonRow.swift
//  TestPokemonFramework
//
//  Created by KaayZenn on 27/07/2024.
//

import SwiftUI
import TyradexKit

struct PokemonRow: View {
    
    // Builder
    var pokemon: Pokemon
    
    // MARK: -
    var body: some View {
        HStack(spacing: 16) {
            if let sprites = pokemon.sprites, let url = URL(string: sprites.regular) {
                AsyncImage(url: url) { image in
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.Apple.componentInComponent)
                        .overlay {
                            image
                                .resizable()
                                .scaledToFill()
                                .padding(10)
                        }
                } placeholder: {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.Apple.componentInComponent)
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(width: 82, height: 82)
                .overlay(alignment: .topLeading) {
                    if let pokedexID = pokemon.pokedexID {
                        Text("#" + (pokedexID < 10 ? "0\(pokedexID)" : "\(pokedexID)"))
                            .font(.system(size: 12, weight: .semibold, design: .monospaced))
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.Apple.backgroundComponent)
                            }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pokemon.nameLocalized)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                HStack {
                    if let stats = pokemon.stats {
                        if let atk = stats.atk {
                            Text("ATK: \(atk)")
                        }
                        if stats.atk != nil, stats.def != nil {
                            Text("|")
                        }
                        if let def = stats.def {
                            Text("DEF: \(def)")
                        }
                    }
                }
                .font(.system(size: 14, weight: .medium, design: .monospaced))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
            
            VStack(spacing: 8) {
                ForEach(pokemon.types) { type in
                    if let urlString = type.image, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                                .overlay {
                                    ProgressView()
                                }
                        }
                        .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.vertical)
            .padding(.trailing)
        }
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    PokemonRow(pokemon: .preview)
        .padding()
        .background(Color.black.opacity(0.3))
}
