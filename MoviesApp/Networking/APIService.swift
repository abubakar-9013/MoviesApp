//
//  APIService.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import Foundation

enum ApiService {
    case getPopularMovies
    case getMovieDetail(movieId: Int)
}

extension ApiService {
    
    var baseURL: URL {
        switch self {
        case .getPopularMovies, .getMovieDetail:
            return AppConst.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getPopularMovies:
            return "/popular"
        case .getMovieDetail(movieId: let movieId):
            return "\(movieId)"
        }
    }
    
    var parameters: [String : CustomStringConvertible] {
        switch self {
        case .getPopularMovies, .getMovieDetail(movieId: _):
            let parameters: [String : CustomStringConvertible] = [
                "api_key": AppConst.apiKey,
                "language": Locale.preferredLanguages[0]
            ]
            return parameters
        }
    }
}
