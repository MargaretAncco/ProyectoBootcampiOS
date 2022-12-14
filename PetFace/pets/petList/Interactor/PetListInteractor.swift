//
//  PetListInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

protocol PetListInteractorProtocol{
    func favoritePetList()
}
class PetListInteractor : PetListInteractorProtocol{
    var presenter: PetListPresenterProtocol
    var api: RemoteRepository
    required init(presenter: PetListPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func favoritePetList() {
        api.fetchFavoritePets(addPet: {
            self.presenter.showFavoritePets(petList: [$0])
            
        })
        
    }
}
