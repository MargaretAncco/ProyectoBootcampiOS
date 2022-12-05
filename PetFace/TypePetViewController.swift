//
//  TypePetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 3/12/22.
//

import UIKit
protocol TypePetDelegate{
    func typePetTableViewController(_ viewController: TypePetTableViewController, didSelectType type: TypePet)
}

class TypePetTableViewController: UITableViewController {
    let tableResults = ResultsTypeTableViewController()
    let typePetList: [String] = TypePet.allCases.map{ $0.rawValue}
    var searchController: UISearchController!
    var delegate: TypePetDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Seleccione tipo"
        navigationItem.searchController = searchController
        
        searchController = UISearchController(searchResultsController: self)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typePetList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = typePetList[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.typePetTableViewController(self, didSelectType: TypePet.allCases[indexPath.row])
        dismiss(animated: true)
    }
    
}
extension TypePetTableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchedText =  searchController.searchBar.text else{
            return
        }
        print(searchedText)
    }
    
    
}
