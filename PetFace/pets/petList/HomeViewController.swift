//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var datasource: [PetImage] = [
            PetImage(name: "Paco", typePet: TypePet.rodent, likesCount: 23, subtype: "jerbo", imageUrl: ""),
            PetImage(name: "Paloma", typePet: TypePet.bird, likesCount: 13, subtype: "paloma", imageUrl: ""),
            PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: "", userLiked: true),
            PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
            PetImage(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "salchicha", imageUrl: ""),
            
        ]
    var petSelected: PetImage?
    @IBOutlet weak private var petCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        petCollectionView.delegate = self
        let cellNib = UINib(nibName: "PetCollectionViewCell", bundle: nil)
        petCollectionView.register(cellNib, forCellWithReuseIdentifier: "PetCollectionViewCell")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let petDetailViewController = segue.destination as? PetDetailViewController{
            petDetailViewController.selectedPet = petSelected
        }
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
      return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let petCell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionViewCell", for: indexPath) as? PetCollectionViewCell{
            petCell.setUp(with: datasource[indexPath.row])
            cell = petCell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pet = datasource[indexPath.row]
        petSelected = pet
        print("item at \(indexPath.section)/\(indexPath.item) \(pet.name) tapped")
        self.performSegue(withIdentifier: "GoToPetDetailNavigation", sender: self)

     }
    
}
