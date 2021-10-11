//
//  Location.swift
//  RM Characters
//
//  Created by Nichita Stefanita on 11.10.2021.
//

import Foundation

struct Location: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
