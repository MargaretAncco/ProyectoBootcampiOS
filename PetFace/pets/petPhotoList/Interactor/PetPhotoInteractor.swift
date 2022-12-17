//
//  PetPhotoInteractor.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation

protocol PetPhotoInteractorProtocol: AnyObject{
    
}
class PetPhotoInteractor : PetPhotoInteractorProtocol{
    unowned var presenter: PetPhotoPresenterProtocol
    var api: RemoteRepository
    required init(presenter: PetPhotoPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }

}
