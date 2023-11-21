//
//  String + Extension.swift
//  MoviesApp
//
//  Created by Muhammad Abubakar on 21/11/2023.
//

import Foundation

extension String {
    func convertDateFormat(from currentFormat: String = "yyyy-MM-dd", to newFormat: String = "dd MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentFormat
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = newFormat
            return dateFormatter.string(from: date)
        }
        return self
    }
    func getYearFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            return "\(date.get(.year))"
        }
        return self
    }
}
