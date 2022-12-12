//
//  PetPhotoPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation

protocol PetPhotoPresenterProtocol{
    
}

class PetPhotoPresenter : PetPhotoPresenterProtocol{
    var interactor: PetPhotoInteractorProtocol?
    var router: PetPhotoRouterProtocol?
    var view: PetPhotoViewProtocol?

}
