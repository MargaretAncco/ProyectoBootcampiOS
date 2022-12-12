//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//

import Foundation
import UIKit

class PetistConfigurator{

    static func makePetList() -> UIViewController {
//        let presenter = PetPhotoPresenter()
//        let api = PetsMockAPI()
//        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
//        let router = PetPhotoRouter(presenter: presenter)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        view.presenter = presenter
//        interactor.presenter = presenter
//        router.presenter = presenter
//        router.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
        
        
        return view
    }
    static func makePetDetail() -> UIViewController {
//        let presenter = PetPhotoPresenter()
//        let api = PetsMockAPI()
//        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
//        let router = PetPhotoRouter(presenter: presenter)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PetDetailViewController") as! PetDetailViewController
//        view.presenter = presenter
//        interactor.presenter = presenter
//        router.presenter = presenter
//        router.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
        
        
        return view
    }
    


    static func makeListPetPhoto() -> UIViewController {
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
    
    static func makeListMyPet() -> UIViewController {
//        let presenter = PetPhotoPresenter()
//        let api = PetsMockAPI()
//        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
//        let router = PetPhotoRouter(presenter: presenter)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PetPhotoCollectionViewController") as! PetPhotoCollectionViewController
        
//        view.presenter = presenter
//        interactor.presenter = presenter
//        router.presenter = presenter
//        router.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
//
        
        return view
    }

    
    static func makeAddMyPet() -> UIViewController {
//        let presenter = PetPhotoPresenter()
//        let api = PetsMockAPI()
//        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
//        let router = PetPhotoRouter(presenter: presenter)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "NewPetViewController") as! NewPetViewController
//        view.presenter = presenter
//        interactor.presenter = presenter
//        router.presenter = presenter
//        router.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
//
        
        return view
    }
    static func makeEditMyPet() -> UIViewController {
//        let presenter = PetPhotoPresenter()
//        let api = PetsMockAPI()
//        let interactor = PetPhotoInteractor(presenter: presenter, api: api)
//        let router = PetPhotoRouter(presenter: presenter)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "EditPetViewController") as! EditPetViewController
//        view.presenter = presenter
//        interactor.presenter = presenter
//        router.presenter = presenter
//        router.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        presenter.view = view
        
        
        return view
    }
    
    static func makeListMyPetPhoto() -> UIViewController {
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
