//
//  PetDetailPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
protocol PetDetailPresenterProtocol{
    func morePhotos(with petId: String)
    func addPetPhoto(with list: [PetImage])
}

class PetDetailPresenter : PetDetailPresenterProtocol{
    func addPetPhoto(with list: [PetImage]) {
        view?.showPetPhoto(list)
    }
    
    var interactor: PetDetailInteractorProtocol?
    var router: PetDetailRouterProtocol?
    var view: PetDetailViewProtocol?

    
    func morePhotos(with petId: String){
        interactor?.morePhotos(with: petId)
    }
}
