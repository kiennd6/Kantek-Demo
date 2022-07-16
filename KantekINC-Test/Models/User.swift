//
//  User.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import Foundation

struct UserLoginResponse: Decodable {
    let result: Bool
    let message: String
    let data: DataType?
    
    enum CodingKeys: String, CodingKey {
        case result
        case message
        case data
    }
}

struct UserData: Decodable {
    let name: String?
    let token: String?

    enum CodingKeys: String, CodingKey {
        case name
        case token
    }
    
}

enum DataType: Decodable {
    case array([String]), userData(UserData)
    init(from decoder: Decoder) throws {
        if let array = try? decoder.singleValueContainer().decode([String].self) {
            self = .array(array)
            return
        }

        if let userData = try? decoder.singleValueContainer().decode(UserData.self) {
            self = .userData(userData)
            return
        }
        throw CordinateError.missingValue
    }
    enum CordinateError: Error {
        case missingValue
    }
}
