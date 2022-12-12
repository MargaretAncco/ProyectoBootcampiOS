//
//  PetResponse.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
struct PetResponse : Decodable{
    var id: String = NSUUID().uuidString
    var name: String = ""
    var typePet: String = ""
    var likesCount: Int = 0
    var subtype: String = ""
    var userId: String = ""
    var userName: String = ""
    var imageUrl: String = ""
    var birthday: String = ""
}
