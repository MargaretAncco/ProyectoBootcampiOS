//
//  PetImageResponse.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
struct PetImageResponse : Decodable {
    var name: String = ""
    var typePet: String = ""
    var userId: String = ""
    var petId: String = ""
    var userName: String = ""
    var imageUrl: String = ""
    var createdAt : String = ""
    var peopleLiked:[String] = []
    
}
