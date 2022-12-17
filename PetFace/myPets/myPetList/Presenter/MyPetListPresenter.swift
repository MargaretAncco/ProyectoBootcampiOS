//
//  MyPetListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetListPresenterProtocol: AnyObject{
    func addMyPet(_ pet: Pet)
    func loadMyPets()
}

class MyPetListPresenter : MyPetListPresenterProtocol{
    
    var interactor: MyPetListInteractorProtocol?
    var router: MyPetListRouterProtocol?
    var view: MyPetListViewProtocol?

    func loadMyPets() {
         interactor?.showMyPets()
     }
     
     func addMyPet(_ pet: Pet) {
         view?.showMyPet(pet)
     }
}
