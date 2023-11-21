//
//  NetworkAdapter.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Decodable>(target: ApiService, completion: @escaping (T?, _ Error: String?) -> ())
}


class ProductionAdapter: NetworkProtocol {
    func request<T: Decodable>(target: ApiService, completion: @escaping (T?, _ Error: String?) -> ()) {
        
        guard var components = URLComponents(url: target.baseURL.appending(path: target.path), resolvingAgainstBaseURL: false) else {
            return
        }
        components.queryItems = target.parameters.keys.map { key in
            URLQueryItem(name: key, value: target.parameters[key]?.description)
        }
        guard let url = components.url else {
            return
        }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription )
                return
            }
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse, nil)
                    }
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            }
        }
        .resume()
    }
}
