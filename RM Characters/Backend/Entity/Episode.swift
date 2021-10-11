//
//  Episode.swift
//  RM Characters
//
//  Created by Nichita Stefanita on 12.10.2021.
//

import Foundation

struct Episode: Decodable {
    let characters: [String]
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case characters
        case name
    }
}
