//
//  NetworkAdapter.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

class NetworkAdapter {
    static func getAdapter() -> NetworkProtocol {
        switch AppConst.selectedNetworkAdapter {
        case .production:
            return ProductionAdapter()
        case .mock:
            return MockAdapter()
        }
    }
}

enum Adapters {
    case production
    case mock
}
