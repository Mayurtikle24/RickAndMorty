//
//  characterModel.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 15/03/24.
//


 // let characterModel = try? JSONDecoder().decode(CharacterModel.self, from: jsonData)

import Foundation

struct CharacterModel: Codable {
    let characterList: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String?
//    let status: Status
//    let species: Species
//    let type: String
//    let gender: Gender
//    let location: Location
//    let origin : Origin
    let image: String?
//    let episode: [String]
//    let url: String
//    let created: String
}

//enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "unknown"
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}
//
//struct Origin: Codable {
//    let name: String
//    let url: String
//}
//
//enum Species: String, Codable {
//    case alien = "Alien"
//    case human = "Human"
//}
//
//enum Status: String, Codable {
//    case alive = "Alive"
//    case dead = "Dead"
//    case unknown = "unknown"
//}



