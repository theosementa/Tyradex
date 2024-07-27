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
    
    @StateObject private var router: NavigationManager = .init(isPresented: .constant(.home))
    
    // Repository
    @StateObject private var pokemonRepo: PokemonRepository = .shared
    
    // MARK: -
    var body: some Scene {
        WindowGroup {
            NavStack(router: router) {
                HomeView()
            }
            .environmentObject(router)
            .environmentObject(pokemonRepo)
            .task {
                await pokemonRepo.fetchPokemons()
            }
        }
    } // End body
} // End struct
