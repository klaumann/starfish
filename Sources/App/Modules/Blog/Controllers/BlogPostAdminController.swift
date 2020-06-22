//
//  BlogPostAdminController.swift
//
//
//  Created by Malte Klaumann on 19.05.20.
//

import Fluent
import Vapor

struct BlogPostAdminController {
    func listView(req: Request) throws -> EventLoopFuture<View> {
        struct Context<T: Encodable>: Encodable {
            let list: [T]
        }
        return BlogPostModel.query(on: req.db)
            .all()
            .mapEach(\.viewContext)
            .flatMap {
                req.view.render("Blog/Admin/Posts/List", Context(list: $0))
            }
    }

    func createView(req: Request) throws -> EventLoopFuture<View> {
        struct Context<T: Encodable>: Encodable {
            let edit: T
        }
        let context = Context(edit: BlogPostEditForm())
        return req.view.render("Blog/Admin/Posts/Edit", context)
    }
    
    func create(req: Request) throws -> EventLoopFuture<Response> {
        let form = try BlogPostEditForm(req: req)
        let model = BlogPostModel()
        model.image = "/images/posts/01.jpg"
        form.write(to: model)
        
        return BlogCategoryModel.query(on: req.db)
            .first()
            .unwrap(or: Abort(.notFound))
            .flatMap { category in
                model.$category.id = category.id!
                return model.create(on: req.db)
            }
            .map {
                req.redirect(to: "/admin/blog/posts")
            }
    }
}
