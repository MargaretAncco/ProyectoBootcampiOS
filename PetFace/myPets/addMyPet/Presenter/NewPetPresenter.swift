//
//  NewPetPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol NewPetPresenterProtocol: AnyObject{
    func addNewPet(pet: Pet)
    func addedNewPet(pet: Pet)
    func addNewPet(imageData imageToupload: Data, with newPet: Pet)
}
class NewPetPresenter{
    weak var view: NewPetViewProtocol?
    var router: NewPetRouterProtocol?
    var interactor: NewPetInteractorProtocol?
    
}

extension NewPetPresenter: NewPetPresenterProtocol{
    func addNewPet(imageData imageToupload: Data, with newPet: Pet) {
        interactor?.uploadNewPet(imageData: imageToupload, with: newPet,didUploadNewPet: {pet in 
            interactor?.updateNewPet(pet: pet)
        })
    }
    
    func addedNewPet(pet: Pet) {
        router?.didUploadPet(pet)
    }
    
    func addNewPet(pet: Pet){
        interactor?.updateNewPet(pet: pet)
    }
}
