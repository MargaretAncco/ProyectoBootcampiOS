//
//  NewPetRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 13/12/22.
//

import Foundation

protocol NewPetRouterProtocol{
    
}

class NewPetRouter{
    var presenter: NewPetPresenterProtocol?
    var view: NewPetViewController?
    
    required init(presenter: NewPetPresenterProtocol) {
        self.presenter = presenter
    }
}

extension NewPetRouter:NewPetRouterProtocol{

}
