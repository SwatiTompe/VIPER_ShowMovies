//
//  Presenter.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//


class MovieSearchPresenter : MovieSearchPresenterProtocol {
    
    weak var view : MovieSearchViewProtocol?
    var interactor : MovieSearchInteractorProtocol?
//    var router: MovieSearchRouterProtocol?
    
    func searchMovies(with keyword: String) {
        interactor?.fetchMovies(keyword: keyword)
    }
    
//    func moviesFetchedSuccessfully(movies: [String]) {
//        view?.showMovies(movies)
//    }
//    
//    func moviesFetchFailed(with error: String) {
//        view?.showError(error)
//    }
    
}

extension MovieSearchPresenter : MoviesSearchInteractorOutputProtocol {
    
    func moviesFetched(movies: [String]) {
        view?.showMovies(movies)
    }
    
    func fetchFailed(error: String) {
        view?.showError(error)
    }
}
