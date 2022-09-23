//
//  PokemonImageView.swift
//  Pokemon
//
//  Created by Vladyslav Filatov on 20/07/2022.
//

import SwiftUI

struct PokemonImageView: View {
    
    @State var pokemonSprite:URL


    var body: some View {
        VStack{
            
            
            
            AsyncImage(url: pokemonSprite) { image in
                
                image.resizable()
                .frame(width: 200, height: 200)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
            .scaledToFit()
            
            
        }
    }

}

