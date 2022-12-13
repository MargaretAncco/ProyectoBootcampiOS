//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit
class PetPhototListConfigurator{
    
    static func makePetList() -> UIViewController {
        let presenter = PetPhotoPresenter()
        let api = PetsMockAPI()
        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
        let router = PetPhotoRouter(presenter: presenter)
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PetPhotoCollectionViewController") as! PetPhotoCollectionViewController
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
