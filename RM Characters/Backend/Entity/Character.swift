//
//  RMCharacter.swift
//  RM Characters
//
//  Created by Nichita Stefanita on 07.10.2021.
//

import Foundation
import UIKit

struct Character: Decodable {
    let id: Int
    let name: String
    let episode: [String]
    let photoURL: String
    let originLocation: Location
    let lastKnownLocation: Location
    let status: String //Status
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case episode
        case photoURL = "image"
        case originLocation = "origin"
        case lastKnownLocation = "location"
        case status
    }
    
    enum Status: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "Unknown"
        
        var indicatorColor: UIColor {
            switch self {
            case .alive: return .green
            case .dead: return .red
            case .unknown: return .gray
            }
        }
    }
}


