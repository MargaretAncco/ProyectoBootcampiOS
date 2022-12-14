//
//  Networking.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//
import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

protocol RemoteRepository{
    func fetchMypets() -> [PetResponse]
    func fetchFavoritePets(addPet: @escaping(PetImage) -> Void?)
    func fetchPetPhotoList() -> [PetImageResponse]
    func fetchPetPhotoUserList(petPhotoid: String,addUser: @escaping (UserLiked)->Void?)
}
class FirebaseApi : RemoteRepository{
    func fetchPetPhotoUserList(petPhotoid: String, addUser: @escaping (UserLiked)->Void?) {
        petRef.child(petPhotoid).getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            snapshot?.children.forEach{
                if let userLikedSnap = ($0 as? DataSnapshot){
                    let id = userLikedSnap.key
                    let name = userLikedSnap.value(forKey: "name") as! String
                    addUser(UserLiked(id: id, name: name))
                    
                }
            }
        })
    }
    
    func fetchFavoritePets(addPet: @escaping(PetImage) -> Void?){
        petRef.getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            snapshot?.children.forEach{
                if let petSnapShot = ($0 as? DataSnapshot){
                    if let petRaw = petSnapShot.value as? NSDictionary{
                        var petImage = PetImage(name: petRaw["name"] as! String,
                                                typePet: TypePet.withLabel(petRaw["typePet"] as! String) ?? TypePet.other, likesCount: petRaw["likesCount"] as? Int ?? 0,
                                                subtype: "", imageUrl: petRaw["imageUrl"] as! String)
                        petImage.id = petSnapShot.key
                        addPet(petImage)
                    }
                }
                
            }
            
            
        })
    }
    

    var ref: DatabaseReference
    var petRef: DatabaseReference
    
    init(){
        ref = Database.database().reference()
        petRef = self.ref.child("PetImage")
    }
    
    
    func fetchMypets() -> [PetResponse] {
        []
        
    }
    
    func fetchPetPhotoList() -> [PetImageResponse] {
        []
    }
    
    
}
