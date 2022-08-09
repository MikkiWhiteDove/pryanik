//
//  PryanikModel.swift
//  Pryanik
//
//  Created by Mishana on 08.08.2022.
//

import Foundation

struct ModelPryanik: Codable {
    let data: [Data]
    let view: [Name]
    
    enum CodingKeys: String, CodingKey {
        case data, view
    }
}

enum Name: String,  Codable {
    case hz, picture, selector
}

struct Data: Codable {
    let name: Name
    let data: DataNames
    
    enum CodingKeys: String, CodingKey {
        case name, data
    }
}

struct DataNames: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case text
        case url
        case selectedID = "selectedId"
        case variants
    }
}

struct Variant: Codable {
    let id: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id, text
    }
}
