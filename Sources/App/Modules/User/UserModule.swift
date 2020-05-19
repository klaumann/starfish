//
//  UserModule.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor
import Fluent

struct UserModule: Module {
    var router: RouteCollection? { UserRouter() }
    
    var migrations: [Migration] {
        [
            UserMigration_v1_0_0(),
        ]
    }
}
