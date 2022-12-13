//
//  MyPetPhotoListInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListInteractorProtocol{
    
}

class MyPetPhotoListInteractor{
    var presenter: MyPetPhotoListPresenterProtocol
    var api: RemoteRepository
    required init(presenter: MyPetPhotoListPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}
extension MyPetPhotoListInteractor: MyPetPhotoListInteractorProtocol{
    
}
