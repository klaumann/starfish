//
//  SelectionFormField.swift
//  
//
//  Created by Malte Klaumann on 25.06.20.
//
import Foundation

struct SelectionFormField: Encodable {
    var value: String = ""
    var error: String? = nil
    var options: [FormFieldOption] = []
}

protocol FormFieldOptionRepresentable {
    var formFieldOption: FormFieldOption{ get }
}
