//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit
class PetistConfigurator{
    
    static func makePetList() -> UIViewController {
        let presenter = PetListPresenter()
        let api = PetsMockAPI()
        let interactor = PetListInteractor(presenter: presenter, api: api)
        let router = PetListRouter(presenter: presenter)
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        router.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        
        return view
    }
}
