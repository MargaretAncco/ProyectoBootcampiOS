//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var datasource = ["adfasdf","adfasdf","aasdfasdf"]
    @IBOutlet weak private var petCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let petCell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "petCell", for: indexPath) as? PetCollectionViewCell{
            petCell.setUp(name: datasource[indexPath.row])
            cell = petCell
            print("dfaddsffvdfvdsf")
        }
        return cell
    }
    
}
