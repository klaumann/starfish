//
//  BlogRouter.swift
//  
//
//  Created by Malte Klaumann on 14.05.20.
//

import Vapor

struct BlogRouter: RouteCollection {
    
    let frontendController = BlogFrontendController()
    let adminController = BlogPostAdminController()
    
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("blog", use: self.frontendController.blogView)
        routes.get(.anything, use: self.frontendController.postView)
        
        routes.grouped([
            UserModelSessionAuthenticator(),
            // UserModel.guardMiddleware(),
            UserModel.redirectMiddleware(path: "/")
        ])
        .grouped("admin","blog")
            .get("posts", use: self.adminController.listView)
            
    }
}
