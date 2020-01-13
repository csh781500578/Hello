import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("users", String.parameter) { req -> String in
        let userID = try req.parameters.next(Int.self)
        return "requested user id #\(userID)"
    }
    
    /// 这种数据转换方式只能接受参数在body中的json数据
    router.post("login") { (req) -> Future<HTTPStatus> in
        let login = try req.content.decode(LoginRequest.self)
        return login.map(to: HTTPStatus.self) { loginRequest in
            print(loginRequest.email)  // user@vapor.codes
            print(loginRequest.password) // don`t look!
            return .ok
        }
    }
    
    router.get("user") { req -> User in
        return User(name: "Vapor User", email: "781500578@qq.com")
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
