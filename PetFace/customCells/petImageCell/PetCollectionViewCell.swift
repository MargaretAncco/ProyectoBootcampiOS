//
//  PetCollectionViewCell.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 6/12/22.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var isFavoriteImage: UIButton!
    @IBOutlet weak var likesCountLabel: UIButton!
    
    var likeAction: ((UICollectionViewCell) -> Void)?
    @IBAction func likeDidClick(_ sender: Any) {
        likeAction?(self)
    }
    func setUp(with pet: PetImage){
        nameLabel.text = pet.name
        likesCountLabel.setTitle(String(pet.likesCount), for: .normal)
        isFavoriteImage.setImage(UIImage(systemName: pet.userLiked ? "heart.fill": "heart"), for: .normal) 
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
