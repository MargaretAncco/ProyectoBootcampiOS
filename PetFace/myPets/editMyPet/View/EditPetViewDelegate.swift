//
//  EditPetViewDelegate.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 6/12/22.
//

import Foundation

protocol EditPetViewDelegate{
    func updatePet(_ viewController: EditPetViewController, didUpdatePet pet: Pet)
    func deletePet(_ viewController: EditPetViewController, didDeletePet pet: Pet)
    func uploadImage(_ viewController: EditPetViewController, didUpdateImage imagePath: Data)
}
