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
    private let tableView = UITableView()
    private var actorMovies : [ActorMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpUI()
    }
    
    func setUpUI() {
        searchBar.delegate = self
        searchBar.placeholder = "search for movies"
        navigationItem.titleView = searchBar

        tableView.frame = view.bounds
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func showMovies(_ movies: [ActorMovies]) {
        self.actorMovies = movies
        tableView.reloadData()
    }
        
    func showError(_ error: String) {
        self.actorMovies = []
        tableView.reloadData()
        print("No movies found.")    }

}

extension MovieSearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text, !keyword.isEmpty {
            print("Presenter is \(presenter == nil ? "nil" : "not nil")") // Debug print
            presenter?.searchMovies(with: keyword)
        }
    }
}

extension MovieSearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorMovies.first?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MovieCell")
        
        if let movie = actorMovies.first?.movies[indexPath.row]{
            cell.textLabel?.text = movie
        }
        return cell
    }
    
}
