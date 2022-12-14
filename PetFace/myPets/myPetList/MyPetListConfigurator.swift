//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

class MyPetListConfigurator{
    static func makeListMyPet() -> UIViewController {
        let presenter = MyPetListPresenter()
        let api = FirebaseApi()
        let interactor = MyPetListInteractor(presenter: presenter, api: api)
        let router = MyPetListRouter(presenter: presenter)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MyPetListViewController") as! MyPetListViewController
        
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
