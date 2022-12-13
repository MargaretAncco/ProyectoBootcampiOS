//
//  PetListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol PetListPresenterProtocol{
    
}

class PetListPresenter : PetListPresenterProtocol{
    var interactor: PetListInteractorProtocol?
    var router: PetListRouterProtocol?
    var view: PetListViewProtocol?

}
