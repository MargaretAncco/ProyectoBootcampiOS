//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var datasource: [Pet] = [Pet(name: "Paco", typePet: "Jerbo", likesCount: 3, race: "", imageUrl: "", userLiked: true),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Firulais", typePet: "Perro", likesCount: 2, race: "", imageUrl: "")]
    @IBOutlet weak private var petCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        petCollectionView.delegate = self
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
    
}
