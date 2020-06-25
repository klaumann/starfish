import Vapor

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        struct Context: Encodable {
            let title: String
            let body: String
        }
        let context = Context(title: "Starfish - Leaf", body: "Hello World!")
        return req.view.render("index", context)
     
    }
}
