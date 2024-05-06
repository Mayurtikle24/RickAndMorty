//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 05/05/24.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var characterviewModel = CharacterViewModel()
    var body: some View {
        NavigationStack{
            ScrollView (.vertical, showsIndicators: false) {
            
                VStack(alignment:.leading) {
                    
                    HStack(spacing: 280){
                        Image("icon_morty").resizable().frame(width: 30,height: 30)
                        Image(systemName: "magnifyingglass").frame(width: 30,height: 30).background(Color.teal).clipShape(.capsule)
                        
                    }.padding(.leading,20)
                    
                 
                 
                    
                    ZStack(alignment:.top) {
                        ZStack(alignment:.bottom) {
                          
                            
                            ZStack(alignment: .leading){
                                Image("cardImage").resizable().scaledToFit().cornerRadius(10).frame(width: 320,height: 300)
                                
                                Text("comming soon").font(.footnote).foregroundColor(.white).padding(.top,155).padding(.leading,10)
                            }
                            Image("banner").resizable().frame(width: 300,height: 300).padding(.bottom,160)
                        }
                    }.frame(width:UIScreen.main.bounds.width,height: 300)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Characters").font(.system(size: 25)).font(.title).foregroundColor(.teal).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Text("Main Characters").font(.caption2).foregroundColor(.teal).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding([.top,.bottom],3)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(characterviewModel.characterList ?? []) { character in
                                    NavigationLink(destination: CharacterDetailsView(character: character)) {
                                        VStack {
                                            AsyncImageView(imageURL: character.image ?? "")
                                            
                                            Text(character.name ?? "").font(.footnote).fontWeight(.bold)
                                            HStack{
                                                Text(character.species ?? "").font(.caption2)
                                                
                                                Text(character.status ?? "").font(.caption2)
                                            }
                                            
                                        }
                                    }
                                }
                            }.padding(.bottom,30)
                           
                            
                        }
                        
                                           
                    }.padding(.top,40).padding([.leading,.trailing,],25)
                   
                }
                .task {
                  await  characterviewModel.getCharacter()
            }
            }
        }
    
        .navigationTitle("Rick And Morty")

    }
    struct AsyncImageView: View {
        var imageURL: String
        
        var body: some View {
            AsyncImage(url: URL(string: imageURL)) { image in
                image.image?
                    .resizable()
                    .frame(width: 100, height: 140)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding(.trailing,10)
                    
            }
        }
    }

}

#Preview {
    CharacterView()
}


