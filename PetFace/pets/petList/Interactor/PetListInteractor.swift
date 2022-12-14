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
    func userLikedList(withPhotoId photoId: String)
}
class PetListInteractor : PetListInteractorProtocol{
    func userLikedList(withPhotoId photoId: String) {
        api.fetchPetPhotoUserList(petPhotoid: photoId, addUser: {
            self.presenter.showUser(id: photoId, user: $0)
        })
    }
    
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
            api.fetchFavoritePets(addPet: {
                self.presenter.showFavoritePets(petList: [$0])
                
            })
        }
    }
}
