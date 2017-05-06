import Vapor
//import HTTP
let drop = Droplet()

//start for debug
let debug = true
let name = "test"
let age = 17
let phone = "18612345678"
let qq = "1504635269"
let address = "universe"
//end for debug

drop.get("/") { req in
    return "Hello, yearbook. ver 2.2"
}

drop.post("/set") { request in
    let name = request.data["name"]?.string
    let age = request.data["age"]?.string
    let phone = request.data["phone"]?.string
    let qq = request.data["qq"]?.string
    let address = request.data["address"]?.string
    return "\(name)\(age)\(phone)\(qq)\(address)"
                 }

drop.get("/version") { request in
     return try JSON(node: [
        "version": "2.2"
    ])
}

drop.get("/admin") { request in
     if(debug) {
     return try JSON(node: [
        "name": "\(name)",
        "age": "\(age)"
    ])
     }
      else {
          return "no debug"
     }
}

drop.run()
