//
//  MyPetCollectionViewCell.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 2/12/22.
//

import UIKit

class MyPetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func setUp(with pet : Pet){
        //petImage. pet.imageUrl
        nameLabel.text = pet.name
    }
}
