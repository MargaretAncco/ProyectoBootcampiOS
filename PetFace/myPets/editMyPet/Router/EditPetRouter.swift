//
//  EditPetRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
protocol EditPetRouterProtocol{
    func didUpdatedPet(_ newPet: Pet)
}

class EditPetRouter: EditPetRouterProtocol{
    var view: EditPetViewController?
    var  presenter: EditPetPresenterProtocol?
    
    required init(presenter: EditPetPresenterProtocol) {
        self.presenter = presenter
    }
    func didUpdatedPet(_ newPet: Pet){
        self.view?.delegate.updatePet(self.view!, didUpdatePet: newPet)
        view?.navigationController?.popViewController(animated: true)
        
    }
    
}
