//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var datasource: [Pet] = [Pet(name: "Paco", typePet: "Jerbo", likesCount: 3, race: "", imageUrl: "", userLiked: true),
                             Pet(name: "Paco", typePet: "Jerbo", likesCount: 3, race: "", imageUrl: ""),
                             Pet(name: "Paco", typePet: "Jerbo", likesCount: 3, race: "", imageUrl: "")]
    @IBOutlet weak private var petCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2//datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let petCell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath) as? PetCollectionViewCell{
            petCell.setUp(with: datasource[indexPath.row])
            cell = petCell
            print("dfaddsffvdfvdsf")
        }
        return cell
    }
}
