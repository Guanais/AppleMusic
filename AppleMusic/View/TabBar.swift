//
//  TabBar.swift
//  AppleMusic
//
//  Created by Kaio Guanais on 2020-11-16.
//

import SwiftUI

struct TabBar: View {
    @State var current = 2
    
    // Miniplayer properties
    @State var expand = false
    @Namespace var animation
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $current) {
                Text("Library")
                    .tag(0)
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Library")
                    }
                    .foregroundColor(.red)
                
                Text("Radio")
                    .tag(1)
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }
                   
                
                Search()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .accentColor(.primary)
           
            MiniPlayer(animation: animation, expand: $expand)
        })
    }
}
