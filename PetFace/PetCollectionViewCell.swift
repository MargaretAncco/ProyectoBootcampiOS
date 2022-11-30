//
//  PetCollectionViewCell.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    func setUp(name: String){
        nameLabel.text = name
    }
}
