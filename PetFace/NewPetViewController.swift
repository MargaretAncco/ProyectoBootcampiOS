//
//  NewPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 3/12/22.
//

import UIKit

class NewPetViewController: UIViewController {
    var newPet: Pet = Pet()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TypePetTableViewController{
            destination.delegate = self
        }
    }
    

}
extension NewPetViewController :TypePetDelegate{
    func typePetTableViewController(_ viewController: TypePetTableViewController, didSelectType type: TypePet) {
        print("selectedd = \(type.rawValue)")
        newPet.typePet = type
    }
    
    
}
