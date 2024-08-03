//
//  PokemonImage.swift
//  Tyradex
//
//  Created by KaayZenn on 02/08/2024.
//

import SwiftUI
import TyradexKit

struct PokemonImage: View {
    
    // Builder
    var pokemon: Pokemon
    @Binding var selectedSprite: URL?
    let animation: Namespace.ID

    // MARK: -
    var body: some View {
        AsyncImage(url: selectedSprite) { image in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    image
                        .resizable()
                        .scaledToFill()
                        .if(selectedSprite != nil) { view in
                            view
                                .matchedGeometryEffect(id: selectedSprite!, in: animation, isSource: true)
                        }
                }
                .overlay(alignment: .topTrailing) {
                    HStack(spacing: 8) {
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
                                .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .padding()
                }
        } placeholder: {
            Color.clear
                .frame(width: 300, height: 300)
                .overlay {
                    ProgressView()
                }
        }
    } // End body
} // End struct
