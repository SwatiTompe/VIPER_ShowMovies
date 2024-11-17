//
//  Interactor.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//

import Foundation

class MovieSearchInteractor : MovieSearchInteractorProtocol {
    
    weak var presenter : MoviesSearchInteractorOutputProtocol?
    
    private var actorMovies: [ActorMovies] = []
    
    init() {
        loadMoviesFromJSON()
    }
    
    private func loadMoviesFromJSON() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodeResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            actorMovies = decodeResponse.movies
        } catch  {
            print("error decoding json \(error)")
        }
    }
    
    
    func fetchMovies(keyword: String) {
        
        // Search for actor's movies based on the keyword
        let filteredMovies = actorMovies.filter { $0.actorName.lowercased().contains(keyword.lowercased()) }
        
        if filteredMovies.isEmpty {
            presenter?.fetchFailed(error: "no Movies found")
        }
        else {
            presenter?.moviesFetched(movies: filteredMovies)
        }
        
    }
    
}
