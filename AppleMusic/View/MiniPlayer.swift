//
//  MiniPlayer.swift
//  AppleMusic
//
//  Created by Kaio Guanais on 2020-11-16.
//

import SwiftUI

struct MiniPlayer: View {
    var animation: Namespace.ID
    @Binding var expand: Bool
    
    var height = UIScreen.main.bounds.height / 3
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var isPresented: Bool = false
    
    // Volume Slider
    @State var volume: CGFloat = 0.6
    
    // Gesture offset
    @State var offset: CGFloat = 0
    
    
    var body: some View {
        
            VStack {
                
                Capsule()
                    .fill(Color.gray)
                    .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                    .opacity(expand ? 1 : 0)
                    .padding(.top, expand ? safeArea?.top : 0)
                    .padding(.vertical, expand ? 30 : 0)
                
                HStack(spacing: 15) {
                    
                    // centering image
                    if expand{(Spacer(minLength: 0))}
                    
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: expand ? height :  55, height: expand ? height : 55)
                        .cornerRadius(15)
                    
                    if !expand {
                        Text("Lady Gaga")
                            .font(.title2)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    
                    Spacer(minLength: 0)
                    
                    if !expand {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "play.fill")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "forward.fill")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                    }
                }
                .padding(.horizontal)
                
                VStack(spacing: 15) {
                    
                    Spacer(minLength: 0)
                    
                    HStack {
                        if expand {
                            Text("Lady Gaga")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                                .matchedGeometryEffect(id: "label", in: animation)
                        }
                        Spacer(minLength: 0)
                        
                    Button(action: {
                        // self.isPresented = true
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }//.sheet(isPresented: $isPresented) {
//                        Adjustments()
//                            .background(Color.primary.opacity(0.7))
//                            .foregroundColor(.primary)
//                    }
                    .padding()
                }
                    .padding()
                    .padding(.top,20)
                    
    //MARK:- Live String
                    HStack {
                        Capsule()
                            .fill(
                                LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(height: 4)
                        Text("LIVE")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Capsule()
                            .fill(
                                LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.1), Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(height: 4)
                    }
                    .padding()
                    
    //MARK:- Stop Button
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "stop.fill")
                            .font(.largeTitle)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 15) {
                        Image(systemName: "speaker.fill")
                        
                        Slider(value: $volume)
                            .accentColor(.primary)
                        
                        Image(systemName: "speaker.wave.2.fill")
                    }
                    .padding()
                    
                    HStack(spacing: 22) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "arrow.up.message")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "airplayaudio")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
                }
                // this will give stretch effect
                .frame(height: expand ? nil : 0)
                .opacity(expand ? 1 : 0)
            }
            // expanding to full screen when clicked
            
            .frame(maxHeight: expand ? .infinity : 70)
            // positioning the miniplayer above tabbar
            // aproximate tabbar hight is 49
            
            // Divider line to separate Miniplayer and TabBar
            .background(
                VStack(spacing: 0) {
                    BlurView()
                    Divider()
                }
                .onTapGesture(perform: {
                    withAnimation(.spring()) {expand = true}
                })
            )
            .cornerRadius(expand ? 20 : 0)
            .offset(y: expand ? 0 : -48)
            .offset(y: offset)
            .gesture(DragGesture().onEnded(onended(value:)).onChanged(onchanged(value:)))
            .ignoresSafeArea()
}
       
    func onchanged(value: DragGesture.Value) {
        
        // only allowed when expanded
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onended(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            
            if value.translation.height > height {
                expand = false
            }
            offset = 0
        }
    }
}
