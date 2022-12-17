//
//  HomeViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 29/11/22.
//

import UIKit

protocol PetListViewProtocol: AnyObject{
    func showFavoritePets(petList list: [PetImage])
    func showUser(id: String ,user: UserLiked)
}
class HomeViewController: UIViewController {
    var presenter: PetListPresenterProtocol?
    var datasource: [PetImage] = []
    var resultsList: [PetImage] = []
    var refreshControl = UIRefreshControl()
    var petSelected: PetImage?
    var searchController: UISearchController!
    
    @IBOutlet weak private var petCollectionView: UICollectionView!
    
    func setRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        petCollectionView.refreshControl = refreshControl
        
    }
    @objc func refresh(_ sender: AnyObject) {
        datasource = []
        presenter?.favoriteList(withPetId: nil)
        resultsList = datasource
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        petCollectionView.dataSource = self
        petCollectionView.delegate = self
        
        searchController = UISearchController()
        navigationItem.searchController  = searchController
        searchController.searchResultsUpdater = self
        
        setRefresh()
        petCollectionView.refreshControl = refreshControl
        
        datasource.forEach{ resultsList.append($0)}
        let cellNib = UINib(nibName: "PetCollectionViewCell", bundle: nil)
        petCollectionView.register(cellNib, forCellWithReuseIdentifier: "PetCollectionViewCell")
        presenter?.favoriteList(withPetId: nil)
        
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
        navigationController?.pushViewController(PetDetailConfigurator.makePetDetail(with: petSelected!), animated: true)
        
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
    func showUser(id: String, user: UserLiked) {
        for (index, item) in datasource.enumerated(){
            if item.id == id{
                resultsList[index].peopleLiked.append(user.name)
            }
        }
    }
    
    
    func showFavoritePets(petList list: [PetImage]) {
        self.datasource.append(contentsOf: list)
        resultsList = datasource
        petCollectionView.reloadData()
    }
    
    
}
