//
//  DataModel.swift
//  Avito test
//
//  Created by Gleb Glushok on 22.08.2022.
//

import Foundation

struct CompanyModel: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employees]
}

struct Employees: Codable {
    let name: String
    let phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
