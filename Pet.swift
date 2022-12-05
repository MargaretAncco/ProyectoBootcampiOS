//
//  Pet.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import Foundation


enum TypePet: CaseIterable {
    case dog
    case cat
    case rodent
    case bird
    case other

}
struct Pet {
    var name: String = ""
    var userLiked: Bool = false
    var typePet: TypePet = TypePet.other
    var likesCount: Int = 0
    var subtype: String = ""
    var imageUrl: String = ""
    
    init(name: String, typePet: TypePet, likesCount: Int, subtype: String, imageUrl: String, userLiked:Bool = false) {
        self.name = name
        self.typePet = typePet
        self.likesCount = likesCount
        self.subtype = subtype
        self.imageUrl = imageUrl
        self.userLiked = userLiked
    }

}
