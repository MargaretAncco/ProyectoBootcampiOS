//
//  PetPhotoCollectionViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 5/12/22.
//

import UIKit

protocol PetPhotoViewProtocol{
    
}

class PetPhotoCollectionViewController: UICollectionViewController, PetPhotoViewProtocol {
    var photoPetList: [PetImage]!
    var presenter: PetPhotoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "PetCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "PetCollectionViewCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoPetList.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var pet = photoPetList[indexPath.row]
        let petCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionViewCell", for: indexPath) as! PetCollectionViewCell
        
        petCell.likeAction = { (cell) in
            if pet.userLiked {
                pet.likesCount -= 1
                pet.userLiked = false
            }else{
                pet.likesCount += 1
                pet.userLiked = true
            }
            self.photoPetList[indexPath.row] = pet
            
            collectionView.reloadData()
        }
        
        petCell.setUp(with: pet)
        return petCell
    }

        
}

extension PetPhotoCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 20.0
        let numberOfItemsPerRow: CGFloat = 3.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    
    }
}
