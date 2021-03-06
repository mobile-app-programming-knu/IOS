//
//  ResponseType.swift
//  QRLibrary
//
//  Created by 한현민 on 2021/05/12.
//

import Foundation


struct User : Codable{
    var id : Int
    var name : String
    var phoneNum : String
    var email : String
    var password : String
    var user_type : String
}

struct LoginResponse : Codable{
    var id : Int
    
    var name : String

    var phoneNum : String

    var email : String

    var password : String
}

struct JoinResponse : Codable{
    var id : Int
    
    var name : String

    var phoneNum : String

    var email : String

    var password : String
}

struct BorrowResponse : Codable & Hashable{
    var borrow_id: Int
    var state: String
    var createdAt: String
    var expiredAt: String
    var user_id : Int
    var user_name : String
    var book: Book
}

struct Book : Codable & Hashable{
    var book_id : Int
    var book_name : String
    var author : String
    var library : String
    var publisher : String
    var publication_date : String
    var image_url : String
}

struct BookResponse : Codable & Hashable{
    var book_id : Int
    var book_name : String
    var author : String
    var library : String
    var publisher : String
    var publication_date : String
    var image_url : String
    var status : String
}

struct ReturnResponse : Codable & Hashable {
    var result : String
}

struct ErrorResponse : Codable{
    var code : String
    var message : String
    var status : Int
    var errors : [CustomFieldError]

    struct CustomFieldError : Codable{
        var field : String
        var value : String
        var reason : String
    }
}
