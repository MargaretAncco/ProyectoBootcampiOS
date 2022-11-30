//
//  PetDetailViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import UIKit

class PetDetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var isFavoriteImage: UIImageView!
    @IBOutlet weak var likesCount: UILabel!
    var selectedPet: Pet!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp(with: selectedPet)
        // Do any additional setup after loading the view.
    }
    func setUp(with selectedPet: Pet){
        nameLabel.text = selectedPet.name
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
