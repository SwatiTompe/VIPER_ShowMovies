//
//  ViewController.swift
//  VIPER_ShowMovies
//
//  Created by Admin on 16/11/24.
//

import UIKit

class MovieSearchViewController: UIViewController, MovieSearchViewProtocol {

    var presenter: MovieSearchPresenterProtocol?
    
     var searchBar = UISearchBar()
     var resultLabel = UILabel()
    
    deinit {
        print("Deinitialized MovieSearchViewController instance:", self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("MovieSearchViewController created via storyboard/XIB:", self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("MovieSearchViewController created programmatically:", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print("Loaded MovieSearchViewController instance:", self)
        print("Presenter:", presenter ?? "nil")
        
        setUpUI()
    }
    
    func setUpUI() {
        searchBar.delegate = self
        searchBar.placeholder = "search for movies"
        searchBar.frame = CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 40)
        self.view.addSubview(searchBar)
        
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .center
        resultLabel.textColor = .black
        resultLabel.frame = CGRect(x: 20, y: 200, width: self.view.frame.width - 40, height: 100)
        self.view.addSubview(resultLabel)
    }
    
    func showMovies(_ movies: [String]) {
        resultLabel.text = "movies fetched : \n" + movies.joined(separator: "\n")
    }
    
    func showError(_ error: String) {
        resultLabel.text = "Movies fetch failed with error = \(error)"
    }

}

extension MovieSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text, !keyword.isEmpty {
            print("Presenter is \(presenter == nil ? "nil" : "not nil")") // Debug print
            presenter?.searchMovies(with: keyword)
        }
    }
}
