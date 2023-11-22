//
//  AppConst.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

struct AppConst {
    static let apiKey = "fdd36001541a6c56389994d6034a0820"
    static let baseURL = URL(string: "https://api.themoviedb.org/3/movie")!
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let selectedNetworkAdapter: Adapters = .production
}
