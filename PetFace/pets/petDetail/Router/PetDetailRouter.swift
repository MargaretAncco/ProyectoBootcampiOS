//
//  PetDetailRouter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
import Foundation
import UIKit

protocol PetDetailRouterProtocol{
    
}

class PetDetailRouter : PetDetailRouterProtocol{
    var presenter: PetDetailPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: PetDetailPresenterProtocol) {
        self.presenter = presenter
    }
}
