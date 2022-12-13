//
//  MyPetPhotoListRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListRouterProtocol{
    
}

class MyPetPhotoListRouter: MyPetPhotoListRouterProtocol{
    var presenter: MyPetPhotoListPresenterProtocol?
    var view: MyPetPhotoCollectionViewController?
    
    required init(presenter: MyPetPhotoListPresenterProtocol) {
        self.presenter = presenter
    }
}
