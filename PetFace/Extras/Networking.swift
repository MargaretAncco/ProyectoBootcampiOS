//
//  Networking.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//
import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseStorage

protocol RemoteRepository{
    func fetchMypets(with userID : String, addPet: @escaping(Pet) -> Void?)
    func fetchFavoritePets(addPet: @escaping(PetImage) -> Void?)
    func fetchPetPhotoList() -> [PetImageResponse]
    func fetchFavoritePets(withPetId petId: String, addPet: @escaping(PetImage) -> Void?)
    func uploadImage(uploadData: Data, completion: @escaping (_ url: String?) -> Void)
    func updatePet(with petId: String, _ pet: Pet, didUpdatePet: @escaping (Pet)-> Void)
}
class FirebaseApi : RemoteRepository{
    
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
                                                typePet: TypePet.withLabel(petRaw["typePet"] as! String) ?? TypePet.other, likesCount: petRaw["likesCount"] as! Int,
                                                subtype: "", imageUrl: petRaw["imageUrl"] as! String)
                        petSnapShot.childSnapshot(forPath: "peopleLiked").children.forEach {
                            if let user = ($0 as? DataSnapshot)?.value as? NSDictionary{
                                let userLiked = user["name"] as! String
                                print(userLiked)
                                petImage.peopleLiked.append(userLiked)
                            }
                        }
                        
                        petImage.id = petSnapShot.key
                        petImage.petId = petRaw["petId"] as! String
                        addPet(petImage)
                    }
                }
                
            }
            
            
            
        })
    }
    func fetchFavoritePets(withPetId petId: String, addPet: @escaping(PetImage) -> Void?){
        petRef.getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            snapshot?.children.forEach{
                if let petSnapShot = ($0 as? DataSnapshot){
                    if let petRaw = petSnapShot.value as? NSDictionary{
                        if petRaw["petId"] as! String == petId{
                            var petImage = PetImage(name: petRaw["name"] as! String,
                                                    typePet: TypePet.withLabel(petRaw["typePet"] as! String) ?? TypePet.other, likesCount: petRaw["likesCount"] as? Int ?? 0,
                                                    subtype: "", imageUrl: petRaw["imageUrl"] as! String)
                            petImage.id = petSnapShot.key
                            addPet(petImage)
                            
                        }
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
    
    
    func fetchMypets(with userID : String , addPet: @escaping(Pet) -> Void?) {
        ref.child("Pet").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            snapshot?.children.forEach{
                if let petSnapShot = ($0 as? DataSnapshot){
                    if let petRaw = petSnapShot.value as? NSDictionary{
                        if (petRaw["userId"] as! String) == userID{
                            var pet = Pet(
                                name: petRaw["name"] as! String,
                                typePet: TypePet.withLabel(petRaw["typePet"] as! String) ?? TypePet.other,
                                likesCount: petRaw["likesCount"] as? Int ?? 0,
                                subtype: petRaw["subtype"] as! String,
                                imageUrl: petRaw["imageUrl"] as! String)
                            pet.userName = petRaw["userName"] as! String
                            pet.userId = petRaw["userId"] as! String
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            if let birthday = dateFormatter.date(from: petRaw["birthday"] as? String ?? ""){
                                pet.birthday = birthday
                            }
                            pet.id = petSnapShot.key
                            addPet(pet)
                            
                        }
                    }
                }
                
            }
            
            
        })
        
    }
    
    func fetchPetPhotoList() -> [PetImageResponse] {
        []
    }
    func uploadImage(uploadData: Data, completion: @escaping (_ url: String?) -> Void) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let userId = AppDelegate.userId
        let timeStamp = formatter.string(from: Date())
        let storageRef = Storage.storage().reference().child("images").child(userId).child("\(timeStamp).jpeg")
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        storageRef.putData(uploadData, metadata: metaData) { (metadata, error) in
            if error != nil {
                completion(nil)
            } else {
                
                storageRef.downloadURL(completion: { (url, error) in
                    print(url?.absoluteString ?? "no se tiene url de la imagen")
                    completion(url?.absoluteString)
                })
                
            }
        }
        
    }
    
    func updatePet(with petId: String, _ pet: Pet, didUpdatePet: @escaping (Pet)-> Void){
        
        var petRequest = PetRequest(name: pet.name, typePet: pet.typePet.rawValue, subtype: pet.subtype, userId: pet.userId, userName: pet.userName, imageUrl: pet.imageUrl)
        
        var petNewValues = ["name": pet.name, "typePet": pet.typePet.rawValue, "subtype": petRequest.subtype, "imageUrl": pet.imageUrl, "userName": pet.userName, "userId": pet.userId, ] as [String : String]
        
        if let birthday =  pet.birthday{
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            petNewValues["birthday"] = formatter.string(from: birthday)
        }else{
            petNewValues["birthday"] = nil
        }
        
        ref.child("Pet").child(petId).setValue(petNewValues, withCompletionBlock: { (error, dataSnapshot) in
            if error != nil{
                print (error ?? "error")
            }else{
                didUpdatePet(pet)
            }
        })
    }
    
}
