//
//  EditPetPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol EditPetPresenterProtocol{
    func uploadImage(data: Data, pet: Pet)
    func updatePet(_ pet: Pet)
    
}
class EditPetPresenter : EditPetPresenterProtocol{
    func updatePet(_ pet: Pet) {
        interactor?.updatePet(pet, didUpdatePet: { self.router?.didUpdatedPet($0) })
    }
    
    var interactor: EditPetInteractorProtocol?
    var router: EditPetRouterProtocol?
    var view: EditPetViewProtocol?

    func uploadImage(data: Data, pet: Pet) {
        interactor?.uploadImage(data: data, pet: pet,didUpdatePet: { self.router?.didUpdatedPet($0) })
    }
    
    
}

