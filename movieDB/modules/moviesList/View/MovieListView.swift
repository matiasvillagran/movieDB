//
//  ContentView.swift
//  movieDB
//
//  Created by Matias Villagran on 22-04-21.
//

import SwiftUI
import Kingfisher

struct MovieListView: View {
    
    @ObservedObject var model = MovieListViewModel(data: ApiManager())
    
    var body: some View {
            NavigationView{
                TabView{
                    List(model.popularMovies) { movie in
                        NavigationLink(
                            //TODO: maybe this is not the right way, to do this
                            destination: MovieDetailView(movie: movie),
                            label: {
                                VStack {
                                    ZStack {
                                        KFImage.url(URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!).resizable()
                                            .loadDiskFileSynchronously()
                                            .cacheMemoryOnly()
                                            .fade(duration: 0.25)
                                            .aspectRatio(16/15, contentMode: .fill)
                                            .cornerRadius(8)
                                    }
                                    Text(movie.original_title)
                                        .font(.headline).bold()
                                    Spacer()
                                }
                            })
                    }
                        .tabItem {
                            Image(systemName: "appletv.fill")
                            Text("Most Popular")
                            
                        }
                    List(model.topRateMovies) { movie in
                        NavigationLink(
                            destination: MovieDetailView(movie: movie),
                            label: {
                                VStack {
                                    ZStack {
                                        KFImage(URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!).resizable()
                                            .aspectRatio(16/15, contentMode: .fill)
                                            .cornerRadius(8)

                                    }
                                    Text(movie.original_title)
                                        .font(.headline).bold()
                                    Spacer()
                                }
                            })
                    }
                    .tabItem {
                        Image(systemName: "applelogo")
                        Text("Top Rated")
                        
                    }
                }
                .animation(.easeIn(duration: 0.1))
                .navigationBarTitle("Movies", displayMode: .inline)
            }
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
