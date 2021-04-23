//
//  MovieData.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import Foundation

struct MovieData : Codable, Hashable {
    var page: Int
    let results: [Movie]
    let total_pages, total_results: Int
}

struct Movie : Codable, Identifiable, Hashable {
    var id: Int
    let adult: Bool
    let original_title: String
    let poster_path: String
    let overview: String
    let vote_average: Double
    
    var ratingText: String {
        let rating = Int(vote_average)
        let ratingText = (0..<rating).reduce("") {(acc, _)  -> String in
            return acc + "⭐️"
        }
        return ratingText
    }

    var scoreText: String {
        return "\(ratingText.count)/10"
    }
}

