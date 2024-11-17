//
//  Entity.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 17/11/24.
//


import Foundation

struct MovieResponse : Decodable {
    let movies : [ActorMovies]
}

struct ActorMovies : Decodable {
    let actorName : String
    let movies : [String]
}
