//
//  ContentView.swift
//  RickAndMorty
//
//  Created by CW Mayur Tikle on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.blue
      }
    
    var body: some View {
        
        
       
            CharacterView()
          
       
        
        
        
    }
}

#Preview {
    ContentView()
}
