import Vapor

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    // Your code here
    let client = try app.make(Client.self)
    let res = try client.get("http://vapor.codes").wait()
    print(res)
}
