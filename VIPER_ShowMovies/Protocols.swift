//
//  Protocols.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//

protocol MovieSearchPresenterProtocol : AnyObject {
    func searchMovies(with keyword: String)
//    func moviesFetchedSuccessfully(movies: [String])
//    func moviesFetchFailed(with error : String)
}

protocol MovieSearchViewProtocol :AnyObject {
    func showMovies(_ movies : [String])
    func showError(_ error : String)
}

protocol MovieSearchInteractorProtocol : AnyObject {
    func fetchMovies(keyword: String)
//    func fetchMovies(with keyword : String)
}

protocol MoviesSearchInteractorOutputProtocol : AnyObject {
    func moviesFetched(movies : [String])
    func fetchFailed(error : String)
}

//protocol MovieSearchRouterProtocol : AnyObject
protocol MovieSearchRouterProtocol {
    static func createModule() -> MovieSearchViewController
}
