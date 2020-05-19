//
//  UserMigration_v1_0_0.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor
import Fluent

struct UserMigration_v1_0_0: Migration {
    
    private func users() -> [UserModel] {
        [
            UserModel(email: "malte@klaumann.org", password: try! Bcrypt.hash("ChangesNeeded11!"))
        ]
    }
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.eventLoop.flatten([
            database.schema(UserModel.schema)
                .id()
                .field(UserModel.FieldKeys.email, .string, .required)
                .field(UserModel.FieldKeys.password, .string, .required)
                .unique(on: UserModel.FieldKeys.email)
                .create()
        ])
            .flatMap {
                self.users().create(on: database)
        }
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.eventLoop.flatten([
            database.schema(UserModel.schema).delete()
        ])
    }
    
}
