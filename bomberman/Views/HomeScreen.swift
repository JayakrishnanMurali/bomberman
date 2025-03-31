//
//  HomeScreen.swift
//  bomberman
//
//  Created by Jayakrishnan M on 31/03/25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isPlaying = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("Bomberman")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                
                VStack(spacing: 20){
                    Button(action: {
                        isPlaying = true
                    }) {
                        Text("Play")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    }
                    
                    
                    Button(action: {
                        print("Settings button pressed")
                    }){
                        Text("Settings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            .navigationDestination(isPresented: $isPlaying){
                GameArena()
            }
        }
    }
}

#Preview {
    HomeScreen()
}
