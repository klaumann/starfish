//
//  AdminController.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor

struct AdminController {
    
    func homeView(req: Request) throws -> EventLoopFuture<View> {
        let user = try req.auth.require(UserModel.self)
        
        struct Context: Encodable {
            let title: String
            let header: String
            let message: String
        }
        
        let context =  Context(title: "Squidcore - Admin", header: "Hi \(user.email)", message: "Welcome to the CMS!")
        return req.view.render("Admin/Home", context)
    }
}
