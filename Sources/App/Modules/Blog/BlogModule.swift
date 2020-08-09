//
//  BlogModule.swift
//  
//
//  Created by Malte Klaumann on 17.05.20.
//

import Vapor
import Fluent

struct BlogModule: Module {
    var router: RouteCollection? {
        BlogRouter()
    }
    
    var migrations: [Migration] {
        [
            BlogMigration_v1_0_0(),
            BlogMigration_v1_1_0(),
        ]
    }
}
