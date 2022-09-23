//
//  ContentView.swift
//  Pokemon
//
//  Created by Vladyslav Filatov on 20/07/2022.
//

import SwiftUI



struct ContentView: View {
    
    @State var pokemon = [PokemonEntry]()
    @State var pokemonDetalhe = [PokemonDetalhe]()

    @State var searchText = ""
    @State var hp:Int = 100
    @State var mp:Int = 100
    @State var progress:Int = 1
    
    



    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchText == "" ? pokemon: pokemon.filter( {$0.name.contains(searchText.lowercased())} )) {
                    entry in
                    
                    HStack {
                        AsyncImage(url: entry.imgURL)
                            .padding(.trailing, 20)
                        
                        NavigationLink("\(entry.name)".capitalized ,destination:
                                        Text("Detail view for \(entry.name), id: \(entry.pokeId), hp \(hp), mp \(mp), progress \(progress). Choose me !!! "))
                        
                       
                    }
                    /*.onAppear {
                    PokemonSelectedApi.getPokemon(url: entry.url) { PokemonDetalhe in
                        self.PokemonDetalhe = pokemonDetalhe
                        }
                    }
                     */
                    /*.onAppear {
                    PokemonSelectedApi.getPokemon(url: entry.url) { PokemonDetalhe in
                        PokemonDetalhe.types
                        print(PokemonDetalhe)
                        }
                    }
                    */
                   
                   
                }
            }
           /* .toolbar {
                Button {
                    print("Let's go to play")
                    print("Player 1 - write your name")
                    let pl1Name = String(readLine()!)
                    print("Player 2 - write your name")
                    let pl2Name = String(readLine()!)
                    print("Start")

                    var hpPl1:Int = 100
                    var hpPl2:Int = 100
                    var mpPl1:Int = 100
                    var mpPl2:Int = 100

                    repeat {

                        print("\(pl1Name) - choose an action")
                        print(" 1 - Attack | 2 - Super power")
                        let randomInt = Int.random(in: 10..<25)
                        let randomSuperInt = Int.random(in: 25..<50)
                        var num = Int(readLine()!)
                        if num == 1 {
                            hpPl2 = hpPl2 - randomInt
                            mpPl1 = mpPl1 - 50
                            print("Super Attack \(randomInt) | \(pl2Name) has hp - \(hpPl2) ")
                            
                        } else if num == 2 {
                            hpPl2 = hpPl2 - randomSuperInt
                            print("Attack \(randomSuperInt) | \(pl2Name) has hp - \(hpPl2) ")                        }
                        // Player 2
                        print("\(pl2Name) - choose an action")
                        print(" 1 - Attack | 2 - Super power")
                        var numPl2 = Int(readLine()!)
                        if numPl2 == 1 {
                            hpPl1 = hpPl1 - randomInt
                            print("Attack \(randomInt) | \(pl1Name) has hp \(hpPl1) ")
                            
                        } else if numPl2 == 2 {
                            hpPl1 = hpPl1 - randomSuperInt
                            mpPl2 = mpPl2 - 50
                            print("Super Attack \(randomSuperInt) | \(pl1Name) has hp \(hpPl1) ")
                        }else {
                            print("Error")
                        }

                    } while hpPl1 > 0 || hpPl2 > 0
                    if hpPl1 >= 0 {
                        print("Player \(pl1Name) win")
                    } else {
                        print("Player \(pl2Name) win")
                    }
                    
                } label: {
                    Image(systemName: "play")
                    
                }
            }
            
           */
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
               
                
            }
            .searchable(text: $searchText)
            .navigationTitle("PokemonsList")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
