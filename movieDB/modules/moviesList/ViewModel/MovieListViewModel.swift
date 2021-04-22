//
//  MovieListViewModel.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import Combine

class MovieListViewModel: ObservableObject {
    
    init() {
        fetchPopularMovies()
    }
    
    @Published var popularMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<MovieListViewModel, Never>()
    
    func fetchPopularMovies() {
        ApiManager().fetchPopularMovies { (movie) in
            self.popularMovies = movie
        }
    }
    
}
