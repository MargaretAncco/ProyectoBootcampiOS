//
//  MyPetListViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 1/12/22.
//

import UIKit

class MyPetListViewController: UIViewController {

    @IBOutlet weak var myPetListCollectionView: UICollectionView!
    var myPetList: [Pet] = [Pet(name: "Paco", typePet: TypePet.rodent, likesCount: 3, subtype: "", imageUrl: ""),
                            Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                            Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                            Pet(name: "Rodolfo", typePet: TypePet.other, likesCount: 4, subtype: "", imageUrl: ""),
                            Pet(name: "Firulais", typePet: TypePet.dog, likesCount: 2, subtype: "", imageUrl: "")]
    var selectedPet: Pet?
    override func viewDidLoad() {
        super.viewDidLoad()
        myPetListCollectionView.dataSource = self
        myPetListCollectionView.delegate = self
    }
    
}

extension MyPetListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myPetList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
      return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let petCell = myPetListCollectionView.dequeueReusableCell(withReuseIdentifier: "myPetCell", for: indexPath) as? MyPetCollectionViewCell {
            petCell.setUp(with: myPetList[indexPath.row])
            return petCell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPet = myPetList[indexPath.row]
        performSegue(withIdentifier: "GoToMyPetDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewPetViewController{
            destination.delegate = self
        }
        if let destination = segue.destination as? EditPetViewController{
            destination.delegate = self
            destination.pet = selectedPet!
        }
    }
    
}

extension MyPetListViewController : NewPetViewDelegate{
    func newPetViewController(_ viewController: NewPetViewController, didAddPet newPet: Pet) {
        myPetList.insert(newPet, at: 0)
        myPetListCollectionView.reloadData()
        dismiss(animated: true)
    }
    
    
}

extension MyPetListViewController: EditPetViewDelegate{
    func updatePet(_ viewController: EditPetViewController, didUpdatePet pet: Pet) {
        if let indexToUpload = myPetList.firstIndex(where: {$0.id == pet.id}){
            myPetList[indexToUpload] = pet
            myPetListCollectionView.reloadData()
        }
    }
    
    func deletePet(_ viewController: EditPetViewController, didDeletePet pet: Pet) {
        if let indexToDelete = myPetList.firstIndex(where: {$0.id == pet.id}){
            myPetList.remove(at: indexToDelete)
            myPetListCollectionView.reloadData()
        }
    }
    
    func uploadImage(_ viewController: EditPetViewController, didUpdateImage imagePath: String) {
        
    }
    
    
}
