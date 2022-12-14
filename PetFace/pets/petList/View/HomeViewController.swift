//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

protocol PetListViewProtocol{
    func showFavoritePets(petList list: [PetImage])
}
class HomeViewController: UIViewController {
    var presenter: PetListPresenterProtocol?
    var datasource: [PetImage] = []
    var resultsList: [PetImage] = []
    
    var petSelected: PetImage?
    var searchController: UISearchController!
    
    @IBOutlet weak private var petCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        petCollectionView.delegate = self
        searchController = UISearchController()
        navigationItem.searchController  = searchController
        searchController.searchResultsUpdater = self
        datasource.forEach{ resultsList.append($0)}
        let cellNib = UINib(nibName: "PetCollectionViewCell", bundle: nil)
        petCollectionView.register(cellNib, forCellWithReuseIdentifier: "PetCollectionViewCell")
        presenter?.favoriteList()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let petDetailViewController = segue.destination as? PetDetailViewController{
            petDetailViewController.selectedPet = petSelected
        }
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
      return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let petCell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionViewCell", for: indexPath) as? PetCollectionViewCell{
            petCell.setUp(with: resultsList[indexPath.row])
            cell = petCell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pet = resultsList[indexPath.row]
        petSelected = pet
        print("item at \(indexPath.section)/\(indexPath.item) \(pet.name) tapped")
        self.performSegue(withIdentifier: "GoToPetDetailNavigation", sender: self)

     }
    
}

extension HomeViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else{
            return
        }
        print(text)
        if text.isEmpty{
            resultsList = datasource
        }else{
            resultsList = []
            datasource.forEach{
                if $0.name.lowercased().contains(text.lowercased()){
                    resultsList.append($0)
                }
            }
        }
        self.petCollectionView.reloadData()
     
    }
    
    
}
extension HomeViewController : PetListViewProtocol{
    func showFavoritePets(petList list: [PetImage]) {
        self.datasource.append(contentsOf: list)
        resultsList = datasource
        petCollectionView.reloadData()
    }
    
    
}
