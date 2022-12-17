//
//  PetPhotoRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
import UIKit

protocol PetPhotoRouterProtocol: AnyObject{
    
}

class PetPhotoRouter : PetPhotoRouterProtocol{
    unowned var presenter: PetPhotoPresenterProtocol
    weak var view: UIViewController?
    
    required init(presenter: PetPhotoPresenterProtocol) {
        self.presenter = presenter
    }
}
