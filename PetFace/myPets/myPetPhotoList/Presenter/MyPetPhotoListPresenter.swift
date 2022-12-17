//
//  MyPetPhotoListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListPresenterProtocol: AnyObject{
    func addImagePet(image: Data, of pet: Pet)
}

class MyPetPhotoListPresenter : MyPetPhotoListPresenterProtocol{
    var interactor: MyPetPhotoListInteractorProtocol?
    weak var router: MyPetPhotoListRouterProtocol?
    weak var view: MyPetPhotoListViewProtocol?

    func addImagePet(image: Data, of pet: Pet) {
        interactor?.addImagePet(image: image, of: pet, didUploadImage: {
            self.view?.addUploadedImage(image: $0)
        })
    }
    
    
}
