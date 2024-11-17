//
//  Interactor.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//

class MovieSearchInteractor : MovieSearchInteractorProtocol {
    
    weak var presenter : MoviesSearchInteractorOutputProtocol?
    
    func fetchMovies(keyword: String) {
        //simulate data from Api or from database
        if keyword.lowercased() == "akshay" {
            presenter?.moviesFetched(movies: ["Phir hera Pheri","Dhadkan","Welcom"])
        } else if keyword.lowercased() == "shahrukh" {
            presenter?.moviesFetched(movies: ["kuch kuch hota he","kabhi Khshi kabhi gam"])
        } else if keyword.lowercased() == "empty" {
            presenter?.fetchFailed(error: "No movies found with keyword \(keyword)")
        } else {
            presenter?.fetchFailed(error: "something went wrong")
        }
        
    }
    
}
