//
//  Utils.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 20/11/2023.
//

import Foundation

class Utils {
    static func loadJson<T: Decodable>(filename fileName: String) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    static func readFromMock<T: Decodable>() -> T? {
        if let mock: T = Utils.loadJson(filename: "\(T.self)_Mock") {
            return mock
        }
        return nil
    }
    static func convertMinutesToMovieDuration(minutes: Int) -> (Int, Int) {
        let hrs = minutes / 60
        let min = minutes % 60
        return (hrs, min)
    }
}
