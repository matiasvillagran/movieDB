//
//  ApiMovieStub.swift
//  movieDBTests
//
//  Created by Matias Villagran on 22-04-21.
//
import Foundation
@testable import movieDB

class ApiMovieStub: DataMovieProtocol {
  
    var movie: [Movie] = []
    
    func fetchPopularMovies(completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
    
    func fetchTopRateMovies(completion: @escaping ([Movie]) -> ()) {
        completion(movie)
    }
    
}
