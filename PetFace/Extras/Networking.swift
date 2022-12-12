//
//  Networking.swift
//  PetFace
//
//  Created by Margaret Alexia Ancco Calloapaza on 11/12/22.
//
import Foundation

protocol RemoteRepository{
    func fetchMypets() -> [PetResponse]
    func fetchFavoritePets() -> [PetImageResponse]
    func fetchPetPhotoList() -> [PetImageResponse]
}

class CustomAPI: RemoteRepository{
    func fetchPetPhotoList() -> [PetImageResponse] {
        []
    }
    
    func fetchMypets() -> [PetResponse]{
        []
    }
    
    func fetchFavoritePets() -> [PetImageResponse] {
        []
    }

    
}

class PetsMockAPI: RemoteRepository{
    func fetchPetPhotoList() -> [PetImageResponse] {
        []
    }
    
    func fetchMypets() -> [PetResponse] {
        []
    }
    
    func fetchFavoritePets() -> [PetImageResponse] {
        let resource = ""
        if let url = Bundle.main.url(forResource: resource, withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                //Api real
                let decoder = JSONDecoder()
                let result = try decoder.decode(PetImageResponse.self, from: data)
                return [result]
                
            }catch let error{
                print(error.localizedDescription)
            }
        }
        
        return []
    }
}
