//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 15/03/24.
//

import Foundation

final class CharacterViewModel :ObservableObject{
   
    
    
    @Published var characterList : [Character]?
    
    func getCharacter()async{
        do{
            let character = try await ApiServices.getCharacter();
            DispatchQueue.main.async {
                self.characterList = character.results
            }
            
        }catch(let error){
         print(error)
        }
    }
}
