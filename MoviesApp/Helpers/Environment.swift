//
//  Environment.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 22/11/2023.
//

import Foundation

public enum Environment {
    enum Keys {
        static let apiKey = "API_KEY"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info list not found")
        }
        return dict
    }()
    static let apiKey: String = {
        guard let apiKeyString = Environment.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API Key not found")
        }
        return apiKeyString
    }()
}
