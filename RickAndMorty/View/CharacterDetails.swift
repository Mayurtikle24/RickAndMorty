//
//  LocationView.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 05/05/24.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    var character : Character;
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
      
        
        VStack(alignment:.center){
            
            AsyncImageView(imageURL: character.image ?? "")
            
            Text(character.name ?? "").font(.title).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            VStack(alignment:.listRowSeparatorLeading){
                ExtractedView(type: "Status:",ans: character.status ?? "")
                ExtractedView(type: "Spacies:",ans: character.species ?? "")
                ExtractedView(type: "Gender:",ans: character.gender ?? "")
                ExtractedView(type: "Origin:",ans: character.origin?.name ?? "")
                ExtractedView(type: "Location:",ans: character.location?.name ?? "")
                ExtractedView(type: "First Episode:",ans: character.episode?.first ?? "")
                
            }.padding( 20)
     
            
                
        }.frame(width: UIScreen.main.bounds.width,height:  UIScreen.main.bounds.height).background(.teal)
    }
    
    struct AsyncImageView: View {
        var imageURL: String
        
        var body: some View {
            
            VStack{
                
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.image?
                        .resizable()
                                       .frame(width: 200, height: 200)
                                       .aspectRatio(contentMode: .fit)
                                       .cornerRadius(20)
                                       .padding(.trailing,10)
                }
         
                    
            }
        }
    }
}

#Preview {
    VStack(alignment:.leading){
        
        Image("icon_morty")
            .resizable()
                           .frame(width: 200, height: 200)
                           .aspectRatio(contentMode: .fit)
                           .cornerRadius(20)
                           .padding(.trailing,10)
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.image?
//                .resizable()
//                .frame(width: 100, height: 140)
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(20)
//                .padding(.trailing,10)
//        
//        }.frame(width: UIScreen.main.bounds.width,height:  UIScreen.main.bounds.height).background(.yellow)
        
        Text("Morty Smith").font(.title).foregroundColor(.yellow).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        
        VStack(alignment:.listRowSeparatorLeading){
            ExtractedView(type: "Status:",ans: "alive")
            ExtractedView(type: "Spacies:",ans: "alive")
            ExtractedView(type: "Gender:",ans: "alive")
            ExtractedView(type: "Origin:",ans: "alive")
            ExtractedView(type: "Location:",ans: "alive")
            ExtractedView(type: "First Episode:",ans: "alive")
            
        }.padding( 20)
 
        
            
    }.frame(width: UIScreen.main.bounds.width,height:  UIScreen.main.bounds.height).background(.teal)
}


struct ExtractedView: View {
    var type:String
    var ans: String
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(type).font(.footnote).foregroundColor(.yellow).fontWeight(.semibold)
            
            Text(ans).font(.footnote).foregroundColor(.white).fontWeight(.semibold)
            
        }.padding(.bottom,10)
    }
}
