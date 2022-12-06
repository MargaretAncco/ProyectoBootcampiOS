//
//  NewPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 3/12/22.
//

import UIKit

protocol NewPetViewDelegate{
    func newPetViewController(_ viewController: NewPetViewController, didAddPet newPet: Pet)
}
class NewPetViewController: UIViewController {
    var newPet: Pet = Pet()
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var includeBirthdaySwitch: UISwitch!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    
    @IBOutlet weak var typePetButton: UIButton!
    var delegate: NewPetViewDelegate!
    
    @IBAction func addPet(_ sender: Any) {
        guard let namePet = nameTextField.text, !namePet.isEmpty else{
            return
        }
        newPet.name =  namePet
        newPet.subtype = ""
        
        newPet.birthday = includeBirthdaySwitch.isOn ? dateOfBirthDatePicker.date : nil
        newPet.imageUrl = ""
        delegate?.newPetViewController(self, didAddPet: newPet)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
        typePetButton.setTitle(type.rawValue, for: .normal) 
        newPet.typePet = type
    }
    
    
}
