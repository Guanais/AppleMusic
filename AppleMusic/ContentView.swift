//
//  ContentView.swift
//  AppleMusic
//
//  Created by Kaio Guanais on 2020-11-16.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabBar()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
