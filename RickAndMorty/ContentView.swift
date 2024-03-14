//
//  ContentView.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var characterviewModel = CharacterViewModel()
    
    var body: some View {
        VStack {
            List(characterviewModel.characterList ?? [],id: \.id){ character in
                
                HStack {
                    AsyncImage(url: URL(string: character.image ?? "" )){ image in
                        
                        image.image?.resizable().aspectRatio(contentMode: .fit).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        
                    }
                    Text(character.name ?? "").font(.footnote).foregroundColor(.black)
                }
                
            }
        }
        .task {
          await  characterviewModel.getCharacter()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
