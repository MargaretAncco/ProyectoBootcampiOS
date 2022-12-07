//
//  PetDetailViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import UIKit

class PetDetailViewController: UIViewController {
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var isFavoriteButton: UIButton!
    
    @IBOutlet weak var likesCountButton: UIButton!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    @IBOutlet weak var petTypeLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    
    @IBAction func closeDetail(_ sender: Any) {
        
    }
    var selectedPet: PetImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp(with: selectedPet)
    }
    func setUp(with selectedPet: PetImage){
        title = selectedPet.name
        
        createdByLabel.text = "Subido por \(selectedPet.userName.isEmpty ? "Unkown" : selectedPet.userName)"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PetPhotoCollectionViewController{
            destination.photoPetList = [
                PetImage(name: "Paco", typePet: TypePet.rodent, likesCount: 23, subtype: "jerbo", imageUrl: ""),
                PetImage(name: "Paloma", typePet: TypePet.bird, likesCount: 13, subtype: "paloma", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: "", userLiked: true),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
                PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
                
            ]
        }
        // Pass the selected object to the new view controller.
    }
    

}

