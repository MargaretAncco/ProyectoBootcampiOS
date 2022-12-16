//
//  MyPetPhotoListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListPresenterProtocol{
    func addImagePet(image: Data, of pet: Pet)
}

class MyPetPhotoListPresenter : MyPetPhotoListPresenterProtocol{
    var interactor: MyPetPhotoListInteractorProtocol?
    var router: MyPetPhotoListRouterProtocol?
    var view: MyPetPhotoListViewProtocol?

    func addImagePet(image: Data, of pet: Pet) {
        interactor?.addImagePet(image: image, of: pet, didUploadImage: {
            self.view?.addUploadedImage(image: $0)
        })
    }
    
    
}
