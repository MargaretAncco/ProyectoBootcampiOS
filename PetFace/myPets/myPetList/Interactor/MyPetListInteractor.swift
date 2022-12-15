//
//  MyPetListInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetListInteractorProtocol{
    func showMyPets()
}
class MyPetListInteractor : MyPetListInteractorProtocol{
    var presenter: MyPetListPresenter
    var api: RemoteRepository
    required init(presenter: MyPetListPresenter, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    func showMyPets(){
        api.fetchMypets(with: "1", addPet: {
            self.presenter.addMyPet($0)
        })
    }
}
