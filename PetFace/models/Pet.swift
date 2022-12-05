//
//  Pet.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import Foundation


enum TypePet: String, CaseIterable {
    case dog = "Perro"
    case cat = "Gato"
    case rodent = "Roedor"
    case bird = "Ave"
    case other = "Otro"

}
struct Pet {
    var name: String = ""
    var userLiked: Bool = false
    var typePet: TypePet = TypePet.other
    var likesCount: Int = 0
    var subtype: String = ""
    var imageUrl: String = ""
    var birthday: Date?
    
    init(name: String, typePet: TypePet, likesCount: Int, subtype: String, imageUrl: String, userLiked:Bool = false, birthday: Date? = nil) {
        self.name = name
        self.typePet = typePet
        self.likesCount = likesCount
        self.subtype = subtype
        self.imageUrl = imageUrl
        self.userLiked = userLiked
        self.birthday = birthday
    }
    init(){
        
    }
}
