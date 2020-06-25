//
//  FormFieldOption.swift
//  
//
//  Created by Malte Klaumann on 25.06.20.
//
struct FormFieldOption: Encodable {
    public let key: String
    public let label: String
    
    public init(key: String, label: String) {
        self.key = key
        self.label = label
    }
}
