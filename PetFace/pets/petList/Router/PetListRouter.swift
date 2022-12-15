//
//  PetListRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

protocol PetListRouterProtocol{
    func showMorePets()
}

class PetListRouter : PetListRouterProtocol{
    var presenter: PetListPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: PetListPresenterProtocol) {
        self.presenter = presenter
    }
    func showMorePets(){
        view?.present(PetPhototListConfigurator.makePetList(), animated: true)
    }
}

