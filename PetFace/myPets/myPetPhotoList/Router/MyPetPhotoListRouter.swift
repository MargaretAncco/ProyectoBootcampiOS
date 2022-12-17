//
//  MyPetPhotoListRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation

protocol MyPetPhotoListRouterProtocol: AnyObject{
    
}

class MyPetPhotoListRouter: MyPetPhotoListRouterProtocol{
    unowned var presenter: MyPetPhotoListPresenterProtocol
    weak var view: MyPetPhotoCollectionViewController?
    
    required init(presenter: MyPetPhotoListPresenterProtocol) {
        self.presenter = presenter
    }
}
