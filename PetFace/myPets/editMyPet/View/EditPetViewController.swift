//
//  EditPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 5/12/22.
//

import UIKit

class EditPetViewController: UIViewController {
    var pet: Pet!
    var delegate: EditPetViewDelegate!
    @IBOutlet weak var subtypeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setDateOfBirthSwitch: UISwitch!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var typeButton: UIButton!
    
    @IBOutlet weak var previewImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func setUp(){
        
        typeButton.setTitle(pet.typePet.rawValue , for: .normal)
        subtypeTextField.text = pet.subtype
        nameTextField.text = pet.name
        if let birthday = pet.birthday {
            birthdayDatePicker.setDate(birthday, animated: false)
            setDateOfBirthSwitch.setOn(true, animated: false)
        }else{
            setDateOfBirthSwitch.setOn(false, animated: false)
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        guard let petName = nameTextField.text, !petName.isEmpty else{
            return
        }
        guard let petSubtype = subtypeTextField.text, !petSubtype.isEmpty else{
            return
        }
        if setDateOfBirthSwitch.isOn {
            pet.birthday = birthdayDatePicker.date
        }
        pet.name = petName
        pet.subtype = petSubtype
        delegate?.updatePet(self, didUpdatePet: pet)
    }
    @IBAction func deletePet(_ sender: Any) {
        delegate?.deletePet(self, didDeletePet: pet)
    }
    @IBAction func takeImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
//        delegate?.uploadImage(self, didUpdateImage: )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMyPetImageList"{
            let destination = segue.destination as? MyPetPhotoCollectionViewController
            
            destination?.imageList = [
                PetImage(name: "Paco", typePet: TypePet.rodent, likesCount: 23, subtype: "jerbo", imageUrl: ""),
                PetImage(name: "Paloma", typePet: TypePet.bird, likesCount: 13, subtype: "paloma", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: "", userLiked: true),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
            ]
        }
        if let destination = segue.destination as? TypePetTableViewController{
            destination.delegate = self
        }
    }
}
extension EditPetViewController : TypePetDelegate{
    func typePetTableViewController(_ viewController: TypePetTableViewController, didSelectType type: TypePet) {
        typeButton.setTitle(type.rawValue, for: .normal)
        pet.typePet = type
        
    }
    
    
}

extension EditPetViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            previewImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}
