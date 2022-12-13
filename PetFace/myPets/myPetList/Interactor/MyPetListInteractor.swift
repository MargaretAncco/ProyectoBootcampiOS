//
//  MyPetListInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetListInteractorProtocol{
    
}
class MyPetListInteractor : MyPetListInteractorProtocol{
    var presenter: MyPetListPresenter
    var api: RemoteRepository
    required init(presenter: MyPetListPresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
