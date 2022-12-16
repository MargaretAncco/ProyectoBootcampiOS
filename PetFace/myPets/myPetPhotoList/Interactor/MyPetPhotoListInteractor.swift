//
//  MyPetPhotoListInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListInteractorProtocol{
    func addImagePet(image: Data, of pet: Pet, didUploadImage: @escaping (PetImage)-> Void)
}

class MyPetPhotoListInteractor{
    var presenter: MyPetPhotoListPresenterProtocol
    var api: RemoteRepository
    required init(presenter: MyPetPhotoListPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
extension MyPetPhotoListInteractor: MyPetPhotoListInteractorProtocol{
    func addImagePet(image: Data, of pet: Pet, didUploadImage: @escaping (PetImage) -> Void) {
        api.uploadPetImage(image: image, of: pet, didUploadImage: didUploadImage)
    }
    
    
    
}
