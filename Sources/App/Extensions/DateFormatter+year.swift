//
//  DateFormatter+year.swift
//  
//
//  Created by Malte Klaumann on 17.05.20.
//

import Foundation

extension DateFormatter {
    static var year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter
    }()
}
