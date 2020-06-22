//
//  AdminRouter.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor

struct AdminRouter: RouteCollection {
    let controller = AdminController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(UserModelSessionAuthenticator())
            .get("admin", use: self.controller.homeView)
    }
}
