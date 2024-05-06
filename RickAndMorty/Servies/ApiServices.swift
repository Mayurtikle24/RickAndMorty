//
//  ApiServices.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 15/03/24.
//

import Foundation


final class ApiServices{
    
    static func getCharacter () async throws -> RickAndMortyListModel{
        
        
        //Character Url
        let characterUrl:String = "https://rickandmortyapi.com/api/character";
        
        //Url
        guard let url = URL(string: characterUrl) else {
            throw Error.invalidUrl
        }
        
        //Get Request
        let (data,response) = try  await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else{
            throw Error.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder();
            return try decoder.decode(RickAndMortyListModel.self,from: data)
        }catch{
            throw Error.invalidData
        }
    }
}

enum Error : LocalizedError{
case invalidUrl;
case invalidData;
case invalidResponse;
    
    var errorDescription: String?{
        switch self{
        case .invalidUrl:
            return "Invalid Url"
        case .invalidData:
            return "Invalid Data"
        case .invalidResponse:
            return "Invalid Response Code"
        }
    }
}
