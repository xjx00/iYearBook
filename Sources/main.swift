import Vapor

let drop = Droplet()

drop.get("/") { _ in
  return "Hello Xjx00"
}

drop.get("/version") { request in
    return try JSON(node: [
        "version": "2.2"
    ])
}
drop.run()
