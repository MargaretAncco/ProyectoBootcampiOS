//
//  PetListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol PetListPresenterProtocol{
    func favoriteList(withPetId petId: String?)
    func viewDidLoad()
    func showFavoritePets(petList list: [PetImage])
    func showUser(id: String,user: UserLiked)
    func showMorePets()
}

class PetListPresenter : PetListPresenterProtocol{
    var interactor: PetListInteractorProtocol?
    var router: PetListRouterProtocol?
    var view: PetListViewProtocol?
    
    func showUser(id: String,user: UserLiked) {
        view?.showUser(id: id,user: user)
    }
    
    func viewDidLoad() {
        
    }

    func favoriteList(withPetId petId: String?) {
        interactor?.favoritePetList(withPetId: petId)
    }
    
    func showFavoritePets(petList list: [PetImage]) {
        view?.showFavoritePets(petList: list)
    }
    
    func showMorePets(){
        router?.showMorePets()
    }
    


}
