//
//  NewPetInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol NewPetInteractorProtocol: AnyObject{
    func updateNewPet(pet: Pet)
    func uploadNewPet(imageData imageToupload: Data, with newPet: Pet,didUploadNewPet: (Pet)-> Void)
}

class NewPetInteractor{
    unowned var presenter: NewPetPresenterProtocol?
    var api: RemoteRepository?

    required init(presenter: NewPetPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}

extension NewPetInteractor : NewPetInteractorProtocol{
    func updateNewPet(pet: Pet){
        api?.addNewPet(pet: pet, didUpdatePet: { newPet in
            self.presenter?.addedNewPet(pet: newPet)
        })
    }
    func uploadNewPet(imageData imageToupload: Data, with newPet: Pet,didUploadNewPet: (Pet)-> Void){
        api?.uploadImage(uploadData: imageToupload, completion: {url in
            var petWithImage = newPet
            petWithImage.imageUrl = url ?? ""
            self.updateNewPet(pet: petWithImage)
        })
    }
}
