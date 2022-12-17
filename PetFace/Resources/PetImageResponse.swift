//
//  PetImageResponse.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
struct PetImageResponse: Codable {
    let createAt, imageURL: String
    let likesCount: Int
    let name, petID, typePet, userID: String
    let userName: String
    let peopleLiked: [PeopleLiked?]?

    enum CodingKeys: String, CodingKey {
        case createAt
        case imageURL = "imageUrl"
        case likesCount, name
        case petID = "petId"
        case typePet
        case userID = "userId"
        case userName, peopleLiked
    }
}

struct PeopleLiked: Codable {
    let name: String
}
