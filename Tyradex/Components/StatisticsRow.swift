//
//  StatisticsRow.swift
//  Tyradex
//
//  Created by KaayZenn on 02/08/2024.
//

import SwiftUI
import TyradexKit

struct StatisticsRow: View {
    
    // Builder
    var pokemon: Pokemon
    
    // Computed
    let columns: [GridItem] = [GridItem(spacing: 10), GridItem(spacing: 10)]
    
    // MARK: -
    var body: some View {
        if let stats = pokemon.stats {
            VStack(spacing: 10) {
                Text("Statistics")
                    .font(.system(size: 24, weight: .semibold, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
                customRow(left: "TOTAL", right: stats.total.toDouble())
                LazyVGrid(columns: columns, spacing: 10) {
                    if let atk = stats.atk {
                        customRow(left: "ATK", right: atk.toDouble())
                    }
                    if let def = stats.def {
                        customRow(left: "DEF", right: def.toDouble())
                    }
                    
                    if let hp = stats.hp {
                        customRow(left: "HP", right: hp.toDouble())
                    }
                    if let vit = stats.vit {
                        customRow(left: "SPEED", right: vit.toDouble())
                    }
                                        
                    if let spe_atk = stats.spe_atk {
                        customRow(left: "SPE ATK", right: spe_atk.toDouble())
                    }
                    if let spe_def = stats.spe_def {
                        customRow(left: "SPE DEF", right: spe_def.toDouble())
                    }
                    
                    customRow(left: "HEIGHT", right: pokemon.height, extra: "m")
                    customRow(left: "WEIGHT", right: pokemon.weight, extra: "kg")
                }
            }
        }
    } // End body
    
    // MARK: - ViewBuilder
    @ViewBuilder
    func customRow(left: String, right: Double, extra: String? = nil) -> some View {
        HStack(spacing: 2) {
            Text(left)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(right.formatted())
                .fontWeight(.heavy)
            if let extra {
                Text(extra)
            }
        }
        .font(.system(size: 18, design: .monospaced))
        .padding(8)
        .padding(.horizontal, 4)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.Apple.backgroundComponent)
        }
    }
    
} // End struct

// MARK: - Preview
#Preview {
    StatisticsRow(pokemon: .preview)
        .padding()
        .background(Color.Apple.background)
}
