//
//  MovieDetailVM.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

class MovieDetailVM: ObservableObject {
    
    @Published var movieDetails: MovieDetail?
    @Published var isLoading = false
    private var networkAdapter: NetworkProtocol
    
    init() {
        self.networkAdapter = NetworkAdapter.getAdapter()
    }
    
    func getMovieDetail(id: Int) {
        isLoading = true
        networkAdapter.request(target: .getMovieDetail(movieId: id), completion: {(response: MovieDetail!, hasError: String?)in
            
            self.isLoading = true
            if let error = hasError{
                print(error)
            }
            if let movieDetail = response {
                DispatchQueue.main.async { [weak self] in
                    self?.movieDetails = movieDetail
                }
            }
        })
    }
    func formatMovieDuration(minutes: Int) -> String {
        let durationInHoursAndMinutes = Utils.convertMinutesToMovieDuration(minutes: minutes)
        return "\(durationInHoursAndMinutes.0)hr \(durationInHoursAndMinutes.1)min"
    }
    func prepareMovieReleaseInfo(movieDetail: MovieDetail) -> String {
        return "\(movieDetail.releaseDate.getYearFromDate())  |  \(movieDetail.genres[0].name)  |  \(formatMovieDuration(minutes: movieDetail.runtime))"
    }
}
