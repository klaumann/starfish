//
//  FrontendRouter.swift
//  
//
//  Created by Malte Klaumann on 14.05.20.
//

import Vapor

struct FrontendRouter: RouteCollection {
    let controller = FrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(UserModelSessionAuthenticator())
            .get(use: self.controller.homeView)
    }
}
