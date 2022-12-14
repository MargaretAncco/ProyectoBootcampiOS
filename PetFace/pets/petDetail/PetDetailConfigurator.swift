//
//  Configurator.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import Foundation
import UIKit
class PetDetailConfigurator{
    
    static func makePetDetail() -> UIViewController {
        let presenter = PetDetailPresenter()
        let api = FirebaseApi()
        let interactor = PetDetailInteractor(presenter: presenter, api: api)
        let router = PetDetailRouter(presenter: presenter)
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PetDetailViewController") as! PetDetailViewController
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
