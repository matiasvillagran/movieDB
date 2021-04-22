//
//  movieDBTests.swift
//  movieDBTests
//
//  Created by Matias Villagran on 22-04-21.
//

import XCTest
@testable import movieDB

class movieDBTests: XCTestCase {
    var modelListViewModel: MovieListViewModel!
    var dummyData: ApiMovieStub!
    
    override func setUpWithError() throws {
        dummyData = ApiMovieStub()
        
        modelListViewModel = MovieListViewModel(data: dummyData)
    }

    override func tearDownWithError() throws {
        modelListViewModel = nil
    }

    func testWhenExternalDataGiveUsTwoObjectsThenPopularMoviesMustBeTwo() {
       //prep
        dummyData.movie = [Movie(id: 1, adult: true, original_title: "dummy", poster_path: "dummy", overview: "dummy", vote_average: 7.0), Movie(id: 2, adult: true, original_title: "dummy", poster_path: "dummy", overview: "dummy", vote_average: 1.0)]
        //action
        modelListViewModel = MovieListViewModel(data: dummyData)
        //assert
        XCTAssertEqual(modelListViewModel.popularMovies.count, 2)
    }
    
    func testWhenExternalDataGiveUsTwoObjectsThenTopRateMoviesMustBeTwo() {
       //prep
        dummyData.movie = [Movie(id: 1, adult: true, original_title: "dummy", poster_path: "dummy", overview: "dummy", vote_average: 7.0), Movie(id: 2, adult: true, original_title: "dummy", poster_path: "dummy", overview: "dummy", vote_average: 1.0)]
        //action
        modelListViewModel = MovieListViewModel(data: dummyData)
        //assert
        XCTAssertEqual(modelListViewModel.topRateMovies.count, 2)
    }

}
