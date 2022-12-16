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
    func favoritePetList(withPetId petId: String?)
}
class PetListInteractor : PetListInteractorProtocol{
    
    
    var presenter: PetListPresenterProtocol
    var api: RemoteRepository
    required init(presenter: PetListPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func favoritePetList(withPetId petId: String?) {
        if let id = petId{
            api.fetchFavoritePets(withPetId: id, addPet: {
                self.presenter.showFavoritePets(petList: [$0])
                
            })
        }else{
            api.fetchFavoritePets(withPetId: nil, addPet: {
                self.presenter.showFavoritePets(petList: [$0])
            })
        }
    }
}
