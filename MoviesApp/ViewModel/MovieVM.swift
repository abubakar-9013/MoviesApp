//
//  ViewModel.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 20/11/2023.
//

import SwiftUI

class MovieVM: ObservableObject {
    
    enum Error: LocalizedError {
        case errorFetching

        var errorDescription: String? {
            switch self {
            case .errorFetching:
                return "Error"
            }
        }

        var recoverySuggestion: String? {
            switch self {
            case .errorFetching:
                return "Unable to fetch data"
            }
        }
    }
    
    private var networkAdapter: NetworkProtocol
    var selectedMovie: Result?
    @Published var movies: [Result] = []
    @Published var isLoading = false
    @Published var movieError: Swift.Error?
    
    
    init() {
        self.networkAdapter = NetworkAdapter.getAdapter()
    }
    
    func getMovies() {
        isLoading = true
        networkAdapter.request(target: .getPopularMovies, completion: {(response: PopularMovies!, hasError: String?) in
            
            self.isLoading = false
            if hasError != nil {
                self.movieError = Error.errorFetching
            }
            if let movies = response {
                DispatchQueue.main.async { [weak self] in
                    self?.movies = movies.results
                }
            }
        })
    }
}
