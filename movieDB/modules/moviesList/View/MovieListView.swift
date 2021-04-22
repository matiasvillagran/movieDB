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
                    }
                        .tabItem {
                            Image(systemName: "appletv.fill")
                            Text("Most Popular")
                            
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
