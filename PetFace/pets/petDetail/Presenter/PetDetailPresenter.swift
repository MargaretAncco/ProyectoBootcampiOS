//
//  PetDetailPresenter.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 12/12/22.
//

import Foundation
protocol PetDetailPresenterProtocol{
    
}

class PetDetailPresenter : PetDetailPresenterProtocol{
    var interactor: PetDetailInteractorProtocol?
    var router: PetDetailRouterProtocol?
    var view: PetDetailViewProtocol?

}
