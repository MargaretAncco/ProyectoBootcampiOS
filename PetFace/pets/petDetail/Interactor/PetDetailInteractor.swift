//
//  PetDetailInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol PetDetailInteractorProtocol{
    
}

class PetDetailInteractor : PetDetailInteractorProtocol{
    var presenter: PetDetailPresenterProtocol
    var api: RemoteRepository
    required init(presenter: PetDetailPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
