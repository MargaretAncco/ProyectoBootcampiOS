//
//  SelectTypePetViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 3/12/22.
//

import UIKit

class SelectTypePetViewController: UIViewController, UITableViewDataSource {
    let searchController = UISearchController()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBOutlet weak var typePetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Seleccione tipo"
        navigationItem.searchController = searchController
//        self.navigationItem.hidesSearchBarWhenScrolling = true
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.isTranslucent = true
//        typePetTableView.register(UITableViewCell.self, forCellReuseIdentifier: "typeCell")
//        typePetTableView.dataSource = self
        
        
    }
    
}
