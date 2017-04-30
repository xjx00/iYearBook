import Vapor

//let drop = Droplet()
//drop.get { req in
 //   return try drop.view.make("welcome", [
 //   	"message": drop.localization[req.lang, "welcome", "title"]
 //   ])
//}
//drop.resource("posts", PostController())
let drop = Droplet()

drop.get("/") { req in
    return "Hello, world."
}

drop.run()
