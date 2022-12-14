//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import UIKit

class MyPetPhotoConfigurator{
    
    static func makeMyPetPhoto() -> UIViewController {
        let presenter = MyPetPhotoListPresenter()
        let api = FirebaseApi()
        let interactor = MyPetPhotoListInteractor(presenter: presenter, api: api)
        let router = MyPetPhotoListRouter(presenter: presenter)
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MyPetPhotoCollectionViewController") as! MyPetPhotoCollectionViewController
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
