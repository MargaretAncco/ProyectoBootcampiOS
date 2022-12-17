//
//  PetDetailPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
protocol PetDetailPresenterProtocol: AnyObject {
    func morePhotos(with petId: String)
    func addPetPhoto(with list: [PetImage])
}

class PetDetailPresenter : PetDetailPresenterProtocol{
    weak var interactor: PetDetailInteractorProtocol?
    weak var router: PetDetailRouterProtocol?
    weak var view: PetDetailViewProtocol?

    
    func addPetPhoto(with list: [PetImage]) {
        view?.showPetPhoto(list)
    }
    
    func morePhotos(with petId: String){
        interactor?.morePhotos(with: petId)
    }
}
