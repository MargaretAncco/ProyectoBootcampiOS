//
//  ImageCollectionViewController.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 6/12/22.
//

import UIKit

private let reuseIdentifier = "Cell"
protocol MyPetPhotoListViewProtocol{
    func addUploadedImage(image: PetImage)
}

class MyPetPhotoCollectionViewController: UICollectionViewController {
    
    var presenter: MyPetPhotoListPresenter?
    var pet: Pet!
    var petId: String = ""
    var imageList: [PetImage]!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "PetCollectionViewCell", bundle: nil)
        petId = pet.id
        collectionView.register(cellNib, forCellWithReuseIdentifier: "PetCollectionViewCell")

    }

    func addUploadedImage(image: PetImage){
        imageList.append(image)
        self.collectionView.reloadData()
        
    }
    
    @IBAction func addImagePet(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        present(imagePickerController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageList.count
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
      return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
     }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionViewCell", for: indexPath)
        if let petCell = cell as? PetCollectionViewCell{
            petCell.setUp(with: imageList[indexPath.row])
            cell = petCell
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
extension MyPetPhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
 

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 20.0
        let numberOfItemsPerRow: CGFloat = 3.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
    
    }
}


extension MyPetPhotoCollectionViewController : MyPetPhotoListViewProtocol{
    func addImageUploaded(_ image: PetImage){
        imageList.append(image)
        self.collectionView.reloadData()
    }
}

extension MyPetPhotoCollectionViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            let imageToupload = pickedImage.jpegData(compressionQuality: 0.5)
            presenter?.addImagePet(image: imageToupload!, of: self.pet)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}
