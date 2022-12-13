//
//  MyPetListRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

protocol MyPetListRouterProtocol{
    
}

class MyPetListRouter : MyPetListRouterProtocol{
    var presenter: MyPetListPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: MyPetListPresenterProtocol) {
        self.presenter = presenter
    }
}

