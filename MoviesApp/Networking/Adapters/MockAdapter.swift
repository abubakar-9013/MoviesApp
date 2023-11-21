//
//  MockAdapter.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

class MockAdapter: NetworkProtocol {
    func request<T: Decodable>(target: ApiService, completion: @escaping (T?, _ Error: String?) -> ()) {
        if let mock: T = Utils.readFromMock() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                completion(mock, nil)
            }
        } else {
            completion(nil, "Error retrieving mock for \(T.self)")
        }
    }
}
