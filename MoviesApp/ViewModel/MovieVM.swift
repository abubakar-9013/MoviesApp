//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 20/11/2023.
//

import Foundation

class MovieVM: ObservableObject {
    
    private var networkAdapter: NetworkProtocol
    var selectedMovie: Result?
    @Published var movies: [Result] = []
    @Published var isLoading = false
    
    
    init() {
        self.networkAdapter = NetworkAdapter.getAdapter()
    }
    
    func getMovies() {
        isLoading = true
        networkAdapter.request(target: .getNowPlayingMovies, completion: {(response: NowPlayingMovies!, hasError: String?) in
            
            self.isLoading = false
            if let error = hasError{
                print(error)
            }
            if let movies = response {
                DispatchQueue.main.async { [weak self] in
                    self?.movies = movies.results
                }
            }
        })
    }
}


