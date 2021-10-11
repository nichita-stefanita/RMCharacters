//
//  Characters.swift
//  RM Characters
//
//  Created by Nichita Stefanita on 11.10.2021.
//

import Foundation

struct Characters: Decodable {
    let all: [Character]
    
    enum CodingKeys: String, CodingKey {
        case all = "results"
    }
}
