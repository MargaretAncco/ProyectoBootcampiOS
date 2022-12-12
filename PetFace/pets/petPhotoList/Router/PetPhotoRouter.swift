//
//  PetPhotoRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
import UIKit

protocol PetPhotoRouterProtocol{
    
}

class PetPhotoRouter : PetPhotoRouterProtocol{
    var presenter: PetPhotoPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: PetPhotoPresenterProtocol) {
        self.presenter = presenter
    }
}
