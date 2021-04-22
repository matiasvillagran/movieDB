//
//  MovieListViewModel.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import Combine

class MovieListViewModel: ObservableObject {
    var data: DataProtocol
    
    init(data: DataProtocol) {
        self.data = data
        fetchPopularMovies()
    }
    
    @Published var popularMovies = [Movie]() {
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
    
}
