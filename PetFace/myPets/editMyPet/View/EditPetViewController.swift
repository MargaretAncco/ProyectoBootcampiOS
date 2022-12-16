//
//  EditPetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 5/12/22.
//

import UIKit

protocol EditPetViewProtocol{
    func showPetPhoto(_ petImage: [PetImage])
}

class EditPetViewController: UIViewController {
    var pet: Pet!
    var newPet: Pet?
    var photoList: [PetImage] = []
    var delegate: EditPetViewDelegate!
    var presenter: EditPetPresenterProtocol?
    
    @IBOutlet weak var subtypeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setDateOfBirthSwitch: UISwitch!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var typeButton: UIButton!
    
    @IBOutlet weak var previewImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        presenter?.morePhotos(with: pet.id)
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
        if !pet.imageUrl.isEmpty{
            previewImage.downloaded(from: pet.imageUrl)
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        guard let petName = nameTextField.text, !petName.isEmpty else{
            return
        }
        guard let petSubtype = subtypeTextField.text, !petSubtype.isEmpty else{
            return
        }
        newPet = pet
        if setDateOfBirthSwitch.isOn {
            newPet?.birthday = birthdayDatePicker.date
        }
        newPet?.name = petName
        newPet?.subtype = petSubtype
        if let imageToupload = self.imageToupload{
            if let newPet = newPet{
                presenter?.uploadImage(data: imageToupload, pet: newPet)
            }
            
        }
        else{
            newPet?.imageUrl = pet.imageUrl
            if let newPet = newPet{
                presenter?.updatePet(newPet)
            }
        }
        
    }
    var imageToupload: Data?
    @IBAction func deletePet(_ sender: Any) {
        delegate?.deletePet(self, didDeletePet: pet)
    }
    @IBAction func takeImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMyPetImageList"{
            let destination = segue.destination as? MyPetPhotoCollectionViewController
            
            destination?.imageList = photoList
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
            imageToupload = previewImage.image?.jpegData(compressionQuality: 0.5)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}


extension EditPetViewController : EditPetViewProtocol{
    func showPetPhoto(_ petImage: [PetImage]) {
        photoList.append(contentsOf: petImage)
    }
}
