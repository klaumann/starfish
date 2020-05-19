import Vapor
import Leaf
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    app.sessions.use(.fluent)
//    app.sessions.configuration.cookieName = "Squidcore Cookie"
    app.migrations.add(SessionRecord.migration)
    
    app.middleware.use(app.sessions.middleware)
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
    
    // Custom Leaf directories
    let workingDirectory = app.directory.workingDirectory
    app.leaf.configuration.rootDirectory = "/"
    app.leaf.files = ModularViewFiles(workingDirectory: workingDirectory, fileio: app.fileio)
    
    
    // run on 0.0.0.0
    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = 80
    
    let modules: [Module] = [
        UserModule(),
        FrontendModule(),
        BlogModule(),
    ]
    
    for module in modules {
        try module.configure(app)
    }
}
