//
//  MyPetListViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 1/12/22.
//

import UIKit

protocol MyPetListViewProtocol{
    func showMyPet(_ pet: Pet)
}

class MyPetListViewController: UIViewController {
    var presenter: MyPetListPresenterProtocol?
    @IBOutlet weak var myPetListCollectionView: UICollectionView!
    
    
    @IBAction func addNewPet(_ sender: Any) {
        let addPetView = NewPetConfigurator.makeNewMyPet(delegate: self)
        present(addPetView, animated: true)
    }
    
    var myPetList: [Pet] = []
    var selectedPet: Pet?
    override func viewDidLoad() {
        super.viewDidLoad()
        myPetListCollectionView.dataSource = self
        myPetListCollectionView.delegate = self
        presenter?.loadMyPets()
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
        let petDetailViewController = EditPetConfigurator.makeEditMyPet(with: selectedPet!, delegate: self)
        navigationController?.pushViewController(petDetailViewController, animated: true)
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
        self.showToast(message: "Se edito \(pet.name)", font: .systemFont(ofSize: 12.0))
    }
    
    func deletePet(_ viewController: EditPetViewController, didDeletePet pet: Pet) {
        if let indexToDelete = myPetList.firstIndex(where: {$0.id == pet.id}){
            myPetList.remove(at: indexToDelete)
            myPetListCollectionView.reloadData()
        }
    }
    
    func uploadImage(_ viewController: EditPetViewController, didUpdateImage imagePath: Data) {
        
    }
    
    
}
extension MyPetListViewController : MyPetListViewProtocol{
    func showMyPet(_ pet: Pet) {
        myPetList.append(pet)
        myPetListCollectionView.reloadData()
    }
    
    
}
