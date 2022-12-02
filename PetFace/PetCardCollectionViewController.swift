//
//  PetCardCollectionViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class PetCardCollectionViewController: UICollectionViewController {
    var myPetList: [Pet] = [Pet(name: "Paco", typePet: "Jerbo", likesCount: 3, race: "", imageUrl: "", userLiked: true),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Rodolfo", typePet: "Reno", likesCount: 4, race: "", imageUrl: ""),
                             Pet(name: "Firulais", typePet: "Perro", likesCount: 2, race: "", imageUrl: "")]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myPetList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}
