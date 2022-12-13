//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

class NewPetConfigurator{
    static func makeNewMyPet() -> UIViewController {
        let presenter = NewPetPresenter()
        let api = PetsMockAPI()
        let interactor = NewPetInteractor(presenter: presenter, api: api)
        let router = NewPetRouter(presenter: presenter)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "NewPetViewController") as! NewPetViewController
        
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
