import Vapor

let drop = Droplet()

drop.get("/") { req in
    return "Hello, world."
}

drop.get("/set") { request in
    let name = request.data["name"]?.string
    let age = request.data["age"]?.string
    let phone = request.data["phone"]?.string
    let qq = request.data["qq"]?.string
    let address = request.data["address"]?.string
    return "\(name)\(age)\(phone)\(qq)\(address)"
                 }
drop.run()
