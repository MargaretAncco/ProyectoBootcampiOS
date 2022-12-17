//
//  PetDetailInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol PetDetailInteractorProtocol: AnyObject{
    func morePhotos(with petId: String)
}

class PetDetailInteractor : PetDetailInteractorProtocol{
    var presenter: PetDetailPresenterProtocol
    var api: RemoteRepository
    required init(presenter: PetDetailPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func morePhotos(with petId: String){
        api.fetchFavoritePets(withPetId: petId, addPet: {self.presenter.addPetPhoto(with: [$0])})
    }
}
