//
//  UserModelSessionAuthenticator.swift
//  
//
//  Created by Malte Klaumann on 19.05.20.
//

import Vapor
import Fluent

struct UserModelSessionAuthenticator: SessionAuthenticator {
    
    typealias User = UserModel
    
    func authenticate(sessionID: User.SessionID, for request: Request) -> EventLoopFuture<Void> {
        User.find(sessionID, on: request.db).map { user in
            if let user = user {
                request.auth.login(user)
            }
        }
    }
}

