//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var datasource: [Pet] = [Pet(name: "Paco", typePet: TypePet.rodent, likesCount: 3, subtype: "", imageUrl: "", userLiked: true),
                             Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                             Pet(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "", imageUrl: "")]
    @IBOutlet weak private var petCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        petCollectionView.delegate = self
    }
    
    func moveToDetail(with pet: Pet) {
        guard let petDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "PetDetailViewController") as? PetDetailViewController else {
            return
        }
        petDetailViewController.selectedPet = pet
        petDetailViewController.modalPresentationStyle = .fullScreen
        self.present(petDetailViewController, animated: false)
        //self.performSegue(withIdentifier: "goToHome", sender: nil)
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
      return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let petCell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath) as? PetCollectionViewCell{
            petCell.setUp(with: datasource[indexPath.row])
            cell = petCell
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pet = datasource[indexPath.row]
        print("item at \(indexPath.section)/\(indexPath.item) \(pet.name) tapped")
        moveToDetail(with: pet)

     }
}
