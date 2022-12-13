//
//  MyPetPhotoListPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListPresenterProtocol{
    
}

class MyPetPhotoListPresenter : MyPetPhotoListPresenterProtocol{
    var interactor: MyPetPhotoListInteractorProtocol?
    var router: MyPetPhotoListRouterProtocol?
    var view: MyPetPhotoListViewProtocol?

}
