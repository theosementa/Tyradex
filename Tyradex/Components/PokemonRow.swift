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
            if let pokedexID = pokemon.pokedexID {
                Text(pokedexID < 10 ? "0\(pokedexID)" : "\(pokedexID)")
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
            }
            
            if let sprites = pokemon.sprites, let url = URL(string: sprites.regular) {
                AsyncImage(url: url) { image in
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .overlay {
                            image
                                .resizable()
                                .scaledToFill()
                                .padding(10)
                        }
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pokemon.nameLocalized)
                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
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
                .font(.system(size: 12, weight: .medium, design: .monospaced))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
        }
    } // End body
} // End struct

// MARK: - Preview
#Preview {
    PokemonRow(pokemon: .preview)
        .padding()
        .background(Color.black.opacity(0.1))
}
