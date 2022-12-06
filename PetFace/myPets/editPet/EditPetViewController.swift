//
//  EditPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 5/12/22.
//

import UIKit

class EditPetViewController: UIViewController {
    var pet: Pet!

    @IBOutlet weak var subtypeTextField: UITextField!
    @IBOutlet weak var nameTextField: UIButton!
    @IBOutlet weak var setDateOfBirthSwitch: UISwitch!
    @IBOutlet weak var typeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func deletePet(_ sender: Any) {
        
    }
    @IBAction func takeImage(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMyPetImageList"{
            let destination = segue.destination as? ImageCollectionViewController
            destination?.imageList = [
                PetImage(name: "Paco", typePet: TypePet.rodent, likesCount: 23, subtype: "jerbo", imageUrl: ""),
                PetImage(name: "Paloma", typePet: TypePet.bird, likesCount: 13, subtype: "paloma", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: "", userLiked: true),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
                
            ]
        }
    }
}
