//
//  MovieDetailView.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    var movie : Movie
    
    var body: some View {
        List {
            ZStack(alignment: .leading){
                KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!).resizable()
                    .renderingMode(.original)
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
            }
            .aspectRatio(16/15, contentMode: .fill)
            .clipped()
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            Text(movie.original_title)
                .font(.headline).bold()
            Text(movie.overview)
            
        }
        .animation(.easeIn(duration: 1.0))
    }
}
