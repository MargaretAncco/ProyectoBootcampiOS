//
//  PetPhotoPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation

protocol PetPhotoPresenterProtocol: AnyObject{
    
}

class PetPhotoPresenter : PetPhotoPresenterProtocol{
    var interactor: PetPhotoInteractorProtocol?
    weak var router: PetPhotoRouterProtocol?
    weak var view: PetPhotoViewProtocol?

}
