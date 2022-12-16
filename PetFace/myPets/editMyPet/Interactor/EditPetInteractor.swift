//
//  EditPetInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation


protocol EditPetInteractorProtocol{
    func uploadImage(data: Data, pet: Pet, didUpdatePet: @escaping (Pet) -> Void)
    func updatePet(_ pet: Pet, didUpdatePet: @escaping (Pet) -> Void)
}
class EditPetInteractor : EditPetInteractorProtocol{
    var presenter: EditPetPresenterProtocol
    var api: RemoteRepository
    required init(presenter: EditPetPresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func uploadImage(data: Data, pet: Pet, didUpdatePet: @escaping (Pet) -> Void) {
        api.uploadImage(uploadData: data, completion: {url in
            var petWithImage = pet
            petWithImage.imageUrl = url ?? ""
            self.updatePet(petWithImage, didUpdatePet: didUpdatePet)
        })
    }
    func updatePet(_ pet: Pet, didUpdatePet: @escaping (Pet) -> Void) {
        api.updatePet(with: pet.id, pet, didUpdatePet: {didUpdatePet($0) })
    }
    
    
}

