//
//  MyPetListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetListPresenterProtocol{
    
}

class MyPetListPresenter : MyPetListPresenterProtocol{
    var interactor: MyPetListInteractorProtocol?
    var router: MyPetListRouterProtocol?
    var view: MyPetListViewProtocol?

}
