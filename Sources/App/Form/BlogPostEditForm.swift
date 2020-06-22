//
//  BlogPostEditForm.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor

final class BlogPostEditForm: Encodable {
    var id: String? = nil
    var title = BasicFormField()
    var slug = BasicFormField()
    var excerpt = BasicFormField()
    var date = BasicFormField()
    var content = BasicFormField()
}
