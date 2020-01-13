//
//  LoginRequest.swift
//  App
//
//  Created by hanrychen on 2020/1/13.
//

import Vapor

struct LoginRequest: Content {
    var email: String
    var password: String
}
