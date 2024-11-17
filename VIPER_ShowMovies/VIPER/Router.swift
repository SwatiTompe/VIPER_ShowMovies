//
//  Router.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//

class MovieSearchRouter : MovieSearchRouterProtocol {
    
    static func createModule() -> MovieSearchViewController {
        
        let view = MovieSearchViewController()
        let presenter = MovieSearchPresenter()
        let interactor = MovieSearchInteractor()
//      let router = MovieSearchRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
//      presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
}
