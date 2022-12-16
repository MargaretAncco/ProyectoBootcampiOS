//
//  EditPetConfigurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

class EditPetConfigurator{
    static func makeEditMyPet(with pet: Pet,delegate: EditPetViewDelegate) -> UIViewController {
        let presenter = EditPetPresenter()
        let api = FirebaseApi()
        let interactor = EditPetInteractor(presenter: presenter, api: api)
        let router = EditPetRouter(presenter: presenter)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "EditPetViewController") as! EditPetViewController
        view.pet = pet
        view.delegate = delegate
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
