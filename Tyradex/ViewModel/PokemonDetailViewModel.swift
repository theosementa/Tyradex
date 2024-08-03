//
//  PokemonDetailViewModel.swift
//  Tyradex
//
//  Created by KaayZenn on 28/07/2024.
//

import Foundation

final class PokemonDetailViewModel: ObservableObject {
    
    @Published var spritesURLs: [URL] = []
    @Published var selectedSprite: URL? = nil
    
}
