//
//  APIService.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import Foundation

enum ApiService {
    case getNowPlayingMovies
    case getMovieDetail(movieId: Int)
}

extension ApiService {
    
    var baseURL: URL {
        switch self {
        case .getNowPlayingMovies, .getMovieDetail:
            return AppConst.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getNowPlayingMovies:
            return "/now_playing"
        case .getMovieDetail(movieId: let movieId):
            return "\(movieId)"
        }
    }
    
    var parameters: [String : CustomStringConvertible] {
        switch self {
        case .getNowPlayingMovies, .getMovieDetail(movieId: _):
            let parameters: [String : CustomStringConvertible] = [
                "api_key": AppConst.apiKey,
                "language": Locale.preferredLanguages[0]
            ]
            return parameters
        }
    }
}
