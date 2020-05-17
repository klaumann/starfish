//
//  FrontendController.swift
//  
//
//  Created by Malte Klaumann on 14.05.20.
//

import Vapor

struct FrontendController {
    func homeView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let title: String
            let header: String
            let message: String
        }
        let context = Context(title: "SquidCore - Home",
                              header: "Hi there,",
                              message: "welcome to SquidCore landing Page")
        return req.view.render("home", context)
    }
}
