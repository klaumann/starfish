import Leaf
import Fluent
import FluentSQLiteDriver
import Liquid
import LiquidLocalDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    app.sessions.use(.fluent)
    app.migrations.add(SessionRecord.migration)
    
    app.middleware.use(app.sessions.middleware)
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.routes.defaultMaxBodySize = "10mb"
    app.fileStorages.use(.local(publicUrl: "http://localhost", publicPath: app.directory.publicDirectory, workDirectory: "assets"), as: .local)

    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease
    
    // Custom Leaf directories
    let workingDirectory = app.directory.workingDirectory
    app.leaf.configuration.rootDirectory = "/"
    app.leaf.files = ModularViewFiles(workingDirectory: workingDirectory, fileio: app.fileio)
    
    // Try to automigrate
    // app.autoMigrate()
    
    // run on 0.0.0.0
    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = 80
    
    let modules: [Module] = [
        AdminModule(),
        BlogModule(),
        FrontendModule(),
        UserModule(),
    ]
    
    for module in modules {
        try module.configure(app)
    }
}
