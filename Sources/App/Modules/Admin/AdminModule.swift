//
//  AdminModule.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor
import Fluent

struct AdminModule: Module {
    var router: RouteCollection? { AdminRouter() }
}
