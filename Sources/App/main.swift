import Vapor
import Auth
import Fluent
import VaporMemory
//import HTTP
//import SwiftyXML
let drop = Droplet()

let crversion = "3.1"
//start for debug
let debug = true
let name = "test"
let age = 17
let phone = "18612345678"
let qq = "1504635269"
let address = "universe"
//end for debug

try drop.addProvider(VaporMemory.Provider.self) // in memory "database"
let auth = AuthMiddleware(user: User.self)
drop.middleware.append(auth)
drop.preparations = [User.self]


drop.get("/") { req in
    return "Hello, yearbook. ver \(crversion)"
}

drop.post("/set") { request in
    let name = request.data["name"]?.string
    let age = request.data["age"]?.string
    let phone = request.data["phone"]?.string
    let qq = request.data["qq"]?.string
    let address = request.data["address"]?.string
    return "\(name)\(age)\(phone)\(qq)\(address)"
    //if(debug) {
    // return try JSON(node: [
     //   "name": "\(name)",
     //   "age": "\(age)",
      //  "phone": "\(phone)",
      //  "qq": "\(qq)",
      //  "address": "\(address)"
    //])
    // }
    //  else {
     //     return "no debug"
    // }

                 }

drop.get("/version") { request in
     return try JSON(node: [
        "version": "\(crversion)"
    ])
}

//drop.get("/admin") { request in
     //if(debug) {
     //return try JSON(node: [
     //   "name": "\(name)",
     //   "age": "\(age)",
     //   "phone": "\(phone)",
     //   "qq": "\(qq)",
     //   "address": "\(address)"
    //])
    /// }
     // else {
     //     return "no debug"
     //}
//}

drop.get("/weixin") { req in
//get info
     let signature = req.data["signature"]?.string
     let timestamp = req.data["timestamp"]?.string
     let nonce = req.data["nonce"]?.string
     let echostr = req.data["echostr"]?.string
     let token = "xjx115478" //token

     if(echostr != nil){
        return echostr!
	 }else{
	     return "no echostr"
	 }
		    }

drop.post("/weixin") { req in
    if let contentType = req.headers["Content-Type"], contentType.contains("application/xml"), let bytes = req.body.bytes {
       //let xml = XML(data: bytes)
       //let msg = xml["Content"][0].string // let msg = node["xml","Content"]?.text
       
     print("Got msg: \(bytes)")
   }
	 
     return "success"
}

drop.group("users") { users in
    users.post { req in
        guard let name = req.data["name"]?.string else {
            throw Abort.badRequest
        }

        var user = User(name: name)
        try user.save()
        return user
    }
                    }

drop.run()
