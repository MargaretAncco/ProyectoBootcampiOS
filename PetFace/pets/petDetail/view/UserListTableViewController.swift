//
//  UserListTableViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 14/12/22.
//

import UIKit

class UserListTableViewController: UITableViewController {
    var userList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = userList[indexPath.row]


        return cell
    }
    
}
