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
    func addPetPhoto(with list: [PetImage])
    func morePhotos(with petId: String)
}
class EditPetPresenter : EditPetPresenterProtocol{
    
    var interactor: EditPetInteractorProtocol?
    var router: EditPetRouterProtocol?
    var view: EditPetViewProtocol?

    func updatePet(_ pet: Pet) {
        interactor?.updatePet(pet, didUpdatePet: { self.router?.didUpdatedPet($0) })
    }
    
    func uploadImage(data: Data, pet: Pet) {
        interactor?.uploadImage(data: data, pet: pet,didUpdatePet: { self.router?.didUpdatedPet($0) })
    }
    
    func addPetPhoto(with list: [PetImage]) {
        view?.showPetPhoto(list)
    }
    
    func morePhotos(with petId: String){
        interactor?.morePhotos(with: petId)
    }
    
}

