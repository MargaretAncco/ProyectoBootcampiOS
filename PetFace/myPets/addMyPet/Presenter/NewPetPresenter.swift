//
//  NewPetPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol NewPetPresenterProtocol{
    
}
class NewPetPresenter{
    var view: NewPetViewProtocol?
    var router: NewPetRouterProtocol?
    var interactor: NewPetInteractorProtocol?
    
}

extension NewPetPresenter: NewPetPresenterProtocol{
    
}
