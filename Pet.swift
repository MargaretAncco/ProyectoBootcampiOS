//
//  Pet.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import Foundation


struct Pet {
    var name: String = ""
    var userLiked: Bool = false
    var typePet: String = ""
    var likesCount: Int = 0
    var race: String = ""
    var imageUrl: String = ""
    
    init(name: String, typePet: String, likesCount: Int, race: String, imageUrl: String, userLiked:Bool = false) {
        self.name = name
        self.typePet = typePet
        self.likesCount = likesCount
        self.race = race
        self.imageUrl = imageUrl
        self.userLiked = userLiked
    }

}
