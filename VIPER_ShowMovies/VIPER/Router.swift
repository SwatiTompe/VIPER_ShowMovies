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
//        let router = MovieSearchRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
//        presenter.router = router
        interactor.presenter = presenter
        
        // Debug prints to verify
        print("Presenter:", presenter)
        print("Presenter's View:", presenter.view ?? "nil")
        print("Presenter's Interactor:", presenter.interactor ?? "nil")
//        print("Presenter's Router:", presenter.router ?? "nil")
        print("Interactor's Presenter:", interactor.presenter ?? "nil")

        return view
    }
    
}
