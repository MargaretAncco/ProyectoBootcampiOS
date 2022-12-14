//
//  PetListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol PetListPresenterProtocol{
    func favoriteList()
    func viewDidLoad()
    func showFavoritePets(petList list: [PetImage])
}

class PetListPresenter : PetListPresenterProtocol{
    func viewDidLoad() {
        
    }
    
    var interactor: PetListInteractorProtocol?
    var router: PetListRouterProtocol?
    var view: PetListViewProtocol?

    func favoriteList() {
        interactor?.favoritePetList()
    }
    
    func showFavoritePets(petList list: [PetImage]) {
        view?.showFavoritePets(petList: list)
    }
    


}
