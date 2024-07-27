//
//  TyradexApp.swift
//  Tyradex
//
//  Created by KaayZenn on 27/07/2024.
//

import SwiftUI
import TyradexKit

@main
struct TyradexApp: App {
    
    // Repository
    @StateObject private var pokemonRepo: PokemonRepository = .shared
    
    // MARK: -
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(pokemonRepo)
                .task {
                    await pokemonRepo.fetchPokemons()
                }
        }
    } // End body
} // End struct
