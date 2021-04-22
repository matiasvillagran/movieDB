//
//  ApiManager.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import Foundation

class ApiManager {
    func fetchPopularMovies(completion: @escaping([Movie]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44") else {return}
        URLSession.shared.dataTask(with: url) { data, success, error in
            guard let data = data, error == nil, let response = success as? HTTPURLResponse else {
                return
            }
            if response.statusCode == 200 {
                do {
                    
                    let movies = try JSONDecoder().decode(MovieData.self, from: data)
                    DispatchQueue.main.async {
                        completion(movies.results)
                       
                    }
                } catch let error {
                    print(error)
                }
            }
        } .resume()
    }
}
