//
//  StringExtension.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        let date = dateFormatter.date(from: self)
        return date
    }
}
