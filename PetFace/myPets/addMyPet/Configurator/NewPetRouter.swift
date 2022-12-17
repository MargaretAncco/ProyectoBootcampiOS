//
//  NewPetRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 13/12/22.
//

import Foundation

protocol NewPetRouterProtocol: AnyObject{
    func didUploadPet(_ pet: Pet)
}

class NewPetRouter{
    unowned var presenter: NewPetPresenterProtocol
    weak var view: NewPetViewController?
    
    required init(presenter: NewPetPresenterProtocol) {
        self.presenter = presenter
    }
}

extension NewPetRouter:NewPetRouterProtocol{
    func didUploadPet(_ pet: Pet){
        view?.delegate.newPetViewController(view!, didAddPet: pet)
    }
}
