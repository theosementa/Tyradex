//
//  SpriteRow.swift
//  Tyradex
//
//  Created by KaayZenn on 28/07/2024.
//

import SwiftUI

struct SpriteRow: View {
    
    // Builder
    var sprite: URL
    
    @Binding var selectedSprite: URL?
    @Binding var nextSelectedSprite: URL?

    let animation: Namespace.ID
    
    // MARK: -
    var body: some View {
        Button(action: {
            nextSelectedSprite = sprite
            withAnimation(.easeInOut(duration: 0.3)) {
                selectedSprite = nil
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    selectedSprite = nextSelectedSprite
                }
            }
        }, label: {
            AsyncImage(url: sprite) { image in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.Apple.backgroundComponent)
                    .overlay {
                        if selectedSprite != sprite {
                            image
                                .resizable()
                                .scaledToFit()
                                .padding(10)
                                .matchedGeometryEffect(id: sprite, in: animation)
                        }
                    }
            } placeholder: {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.Apple.backgroundComponent)
                    .overlay {
                        ProgressView()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
        })
    } // End body
} // End struct

// MARK: - Preview
//#Preview {
//    SpriteRow()
//}