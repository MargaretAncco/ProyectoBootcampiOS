//
//  PetImage.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 5/12/22.
//

import Foundation
struct PetImage {
    var id: String = ""
    var name: String = ""
    var userLiked: Bool = false
    var typePet: TypePet = TypePet.other
    var likesCount: Int = 0
    var subtype: String = ""
    var userId: String = ""
    var petId: String = ""
    var userName: String = ""
    var imageUrl: String = ""
    var createdAt : Date?
    
    init(){
        
    }
    init(name: String, typePet: TypePet, likesCount: Int, subtype: String, imageUrl: String, userLiked: Bool = false){
        self.name = name
        self.typePet = typePet
        self.likesCount = likesCount
        self.subtype = subtype
        self.imageUrl = imageUrl
        self.userLiked = userLiked
    }
}
