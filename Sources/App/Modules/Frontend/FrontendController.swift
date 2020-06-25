//
//  FrontendController.swift
//  
//
//  Created by Malte Klaumann on 14.05.20.
//

import Vapor

struct FrontendController {
    func homeView(req: Request) throws -> EventLoopFuture<View> {
        var email: String?
        if let user = req.auth.get(UserModel.self) {
            email = user.email
        }
        struct Context: Encodable {
            let title: String
            let header: String
            let message: String
            let email: String?
        }
        let context = Context(title: "Starfish - Home",
                              header: "Welcome,",
                              message: "This is the Starfish landing Page",
                              email: email)
        return req.view.render("Frontend/Home", context)
    }
}
