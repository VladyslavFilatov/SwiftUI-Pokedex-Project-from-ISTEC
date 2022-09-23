//
//  Pokemons.swift
//  Pokemon
//
//  Created by Vladyslav Filatov on 20/07/2022.
//

import Foundation

struct Pokemon : Codable{
    var results: [PokemonEntry]
    
}

struct PokemonEntry : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
    var pokeId:String{
        let url = URL(string: url)
        return url!.lastPathComponent
    }
    var imgURL:URL{
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokeId).png")!
        
    }
    
    var pokeURL:URL{
        URL(string: url)!
    }
    
    
}

class PokeApi  {
    func getData(completion:@escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}

/*
struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    
    
}

struct PokemonSprites : Codable {
    var front_default: String?
}

class PokemonSelectedApi  {
    func getSprite(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
    
    
}

*/


/*
struct PokemonsDatas: Codable{
    var stats: [PokemonStat]
    var types: [PokemonType]
    
    var id:ClosedRange<Int> = 1...151
    var typeURL:URL{
        URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
        
    }
}
*/



struct PokemonDetalhe: Codable{
    var id:Int
    var name:String
    var stats: [PokemonStat]
    var types: [PokemonType]
}
    
struct PokemonStat : Codable{
    var base_stat: Int?
    //var stat:[StatInfo]
    

}



struct PokemonType : Codable {
    //var solt: String?
    var type:TypeInfo
    

}

struct TypeInfo : Codable {
    var name: String?
    

}

/*

class PokemonSelectedApi  {
    
   static func getPokemon(id:Int = 1, completion:@escaping (PokemonDetalhe) -> ()) {
       guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else { return }
       
       URLSession.shared.dataTask(with: url) { (data, response, error) in
           guard let data = data else { return }
            
            let pokemonDatas = try! JSONDecoder().decode(PokemonDetalhe.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonDatas)
            }
        }.resume()
    }
    
    
}
 */

class PokemonSelectedApi  {
    
   static func getPokemon(url: String, completion:@escaping (PokemonDetalhe) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonDatas = try! JSONDecoder().decode(PokemonDetalhe.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonDatas)
            }
        }.resume()
    }
    
    
}

