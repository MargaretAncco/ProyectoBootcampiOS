//
//  MyPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 1/12/22.
//

import UIKit

protocol MyPetViewProtocol{
}

class MyPetViewController: UIViewController {

    var presenter: MyPetListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}

extension MyPetViewController : MyPetViewProtocol{
    
}
