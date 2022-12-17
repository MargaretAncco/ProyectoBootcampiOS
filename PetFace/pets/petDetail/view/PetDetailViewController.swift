//
//  PetDetailViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 30/11/22.
//

import UIKit

protocol PetDetailViewProtocol: AnyObject{
    func showPetPhoto(_ petImage: [PetImage])
}
class PetDetailViewController: UIViewController {
    
    weak var presenter: PetDetailPresenter?
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var isFavoriteButton: UIButton!
    
    @IBOutlet weak var likesCountButton: UIButton!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    @IBOutlet weak var petTypeLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    
    @IBAction func closeDetail(_ sender: Any) {
        
    }
    
    var otherPhotoList: [PetImage] = []
    @IBAction func likePet(_ sender: Any) {
        if selectedPet.userLiked{
            selectedPet.likesCount -= 1
            selectedPet.userLiked = false
            
        }else{
            selectedPet.likesCount += 1
            selectedPet.userLiked = true
        }
        setLike(userDidLike: selectedPet?.userLiked ?? false)
        
    }
    func setLike(userDidLike imageIsLiked: Bool){
        likesCountButton.setTitle(String(selectedPet?.likesCount ?? 0), for: .normal)
        if imageIsLiked{
            isFavoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            isFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    var selectedPet: PetImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp(with: selectedPet)
        presenter?.morePhotos(with: selectedPet.petId)
    }
    func setUp(with selectedPet: PetImage){
        title = selectedPet.name
        petTypeLabel.text = selectedPet.typePet.rawValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.locale = .init(identifier: "es_ES")
        let dateFormat = dateFormatter.string(from: selectedPet.createdAt)
        createdAtLabel.text = dateFormat
        createdByLabel.text = "Subido por \(selectedPet.userName.isEmpty ? "Unkown" : selectedPet.userName)"
        setLike(userDidLike: selectedPet.userLiked)
        petImage.downloaded(from: selectedPet.imageUrl)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserListTableViewController{
            if(selectedPet.userLiked){
                selectedPet.peopleLiked.append("Yo")
            }else{
                for (index, user) in selectedPet.peopleLiked.enumerated(){
                    if user == "Yo"{
                        selectedPet.peopleLiked.remove(at: index)
                    }
                }
            }
            destination.userList = selectedPet.peopleLiked
        }
        if let destination = segue.destination as? PetPhotoCollectionViewController{
            destination.photoPetList = otherPhotoList
        }
        // Pass the selected object to the new view controller.
    }
    

}

extension PetDetailViewController : PetDetailViewProtocol{
    func showPetPhoto(_ petImage: [PetImage]) {
        otherPhotoList.append(contentsOf: petImage)
    }
    
    
}
