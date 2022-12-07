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
    var id: String = NSUUID().uuidString
    var name: String = ""
    var typePet: TypePet = TypePet.other
    var likesCount: Int = 0
    var subtype: String = ""
    var userId: String = ""
    var userName: String = ""
    var imageUrl: String = ""
    var birthday: Date?
    var imageUrlList: [PetImage]? = []
    
    init(name: String, typePet: TypePet, likesCount: Int, subtype: String, imageUrl: String, birthday: Date? = nil) {
        self.name = name
        self.typePet = typePet
        self.likesCount = likesCount
        self.subtype = subtype
        self.imageUrl = imageUrl
        self.birthday = birthday
    }
    init(){
        
    }
}
