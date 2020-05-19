//
//  UserRouter.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor

struct UserRouter: RouteCollection {
    let controller = UserFrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.get("sign-in", use: self.controller.loginView)
        
        routes.grouped(UserModelCredentialsAuthenticator())
            .post("sign-in", use: self.controller.login)
        routes.grouped(UserModelSessionAuthenticator())
            .get("logout", use: self.controller.logout)
    }
}
