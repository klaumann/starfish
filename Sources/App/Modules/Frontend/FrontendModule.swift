//
//  FrontendModule.swift
//  
//
//  Created by Malte Klaumann on 17.05.20.
//

import Vapor
import  Fluent

struct FrontendModule: Module {
    var router: RouteCollection? {
        FrontendRouter()
    }
}
