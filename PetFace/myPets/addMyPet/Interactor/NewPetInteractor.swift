//
//  NewPetInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol NewPetInteractorProtocol{
    
}

class NewPetInteractor{
    var presenter: NewPetPresenterProtocol?
    var api: RemoteRepository?

    required init(presenter: NewPetPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}

extension NewPetInteractor : NewPetInteractorProtocol{
    
}
