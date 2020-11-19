//
//  Adjustments.swift
//  AppleMusic
//
//  Created by Kaio Guanais on 2020-11-18.
//

import SwiftUI

struct Adjustments: View {
    var body: some View {
            Text("Test")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.primary)
                .background(ClearView())
    }
}

struct ClearView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
