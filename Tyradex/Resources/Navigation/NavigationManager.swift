//
//  NavigationManager.swift
//  Krabs
//
//  Created by Theo Sementa on 29/11/2023.
//

import SwiftUI
import TyradexKit

class NavigationManager: Router {

    // push
    func pushHome() {
        navigateTo(.home)
    }

    func pushDetail(pokemon: Pokemon) {
        navigateTo(.detail(pokemon: pokemon))
    }
    
    // sheet
//    func presentCreateNewEntry(dismissAction: (() -> Void)? = nil) {
//        presentSheet(.createNewEntry, dismissAction)
//    }
    
    // Build view
    override func view(direction: NavigationDirection, route: Route) -> AnyView {
        AnyView(buildView(direction: direction, route: route))
    }
}

private extension NavigationManager {

    @ViewBuilder
    func buildView(direction: NavigationDirection, route: Route) -> some View {
        Group {
            switch direction {
            case .home:
                HomeView()
            case .detail(let pokemon):
                PokemonDetailView(pokemon: pokemon)
            }
        }
    }

    func router(route: Route) -> NavigationManager {
        switch route {
        case .navigation:
            return self
        case .sheet:
            return NavigationManager(isPresented: presentingSheet)
        case .fullScreenCover:
            return NavigationManager(isPresented: presentingFullScreen)
        case .modal:
            return NavigationManager(isPresented: presentingModal)
        case .modalCanFullScreen:
            return NavigationManager(isPresented: presentingModalCanFullScreen)
        }
    }
}
