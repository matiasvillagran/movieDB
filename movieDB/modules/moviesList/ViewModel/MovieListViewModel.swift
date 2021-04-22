//
//  MovieListViewModel.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import Combine

class MovieListViewModel: ObservableObject {
    var data: DataMovieProtocol
    
    init(data: DataMovieProtocol) {
        self.data = data
        fetchPopularMovies()
        fetchTopRateMovies()
    }
    
    @Published var popularMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    @Published var topRateMovies = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<MovieListViewModel, Never>()
    
    func fetchPopularMovies() {
        data.fetchPopularMovies { (movie) in
            self.popularMovies = movie
        }
    }
    
    func fetchTopRateMovies() {
        data.fetchTopRateMovies { (movie) in
            self.topRateMovies = movie
        }
    }
    
}
