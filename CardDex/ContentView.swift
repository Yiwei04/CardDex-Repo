//
//  ContentView.swift
//  CardDex
//
//  Created by Jeffery Wang on 22/4/2025.
//

import SwiftUI
import UIKit
import AVFoundation

// Main content view of the app
struct ContentView: View {
    // State variable to manage the owned cards
    @State var ownedCards: OwnedCards = OwnedCards()
    
    // AVPlayer instance to play the background video
    private let player = AVPlayer(url: Bundle.main.url(forResource: "mainbackground", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack{
            ZStack{
                // Layers the background video and the UI elements on top
                // Custom view that plays a looping background video
                VideoBackgroundPlayer(player: player).ignoresSafeArea()
                VStack{
                    Spacer()
                    
                    // App logo
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                    Spacer()
                    
                    // "Begin" button that navigates to the PolicyView
                    NavigationLink(destination: PolicyView()) {
                        Text("Begin")
                            .font(.headline)
                            .foregroundStyle(.purple)
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                            )
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .onAppear(){
            // Shuffle card values when the view appears
            ownedCards.shufflevalues()
        }
        // Hides the back button for cleaner appearance
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
        .environmentObject(OwnedCards()) // Injects the OwnedCards object into the preview
}
