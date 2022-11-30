//
//  PetCollectionViewCell.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var isFavoriteImage: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    func setUp(with pet: Pet){
        nameLabel.text = pet.name
        likesCountLabel.text = String(pet.likesCount)
//        isFavoriteImage.image = UIImage(systemName: "heart.fill")
        isFavoriteImage.image = UIImage(systemName: pet.userLiked ? "heart.fill": "heart")
        func setUp(name: String){
            nameLabel.text = name
        }
    }
}
