//
//  PolicyView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI
import UIKit
import AVFoundation

// View that displays the privacy policy and a video background
struct PolicyView: View {
    // Load video from the app bundle to be used as the background
    private let player = AVPlayer(url: Bundle.main.url(forResource: "mainbackground", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack{
            ZStack{
                // Custom view that plays a looping video as background
                VideoBackgroundPlayer(player: player).ignoresSafeArea()
                VStack{
                    Spacer()
                    //Logo
                    Spacer()
                    // Display the policy message to the user
                    Text("By using this app you agree to\nthe privacy policy.\n\nCurrently only the Pokemon\ncard tracker has been implemented.\n\nPlease be nice  😄")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.purple)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                .frame(width: 300, height: 300)
                        )
                    Spacer()
                    
                    // Navigation link to continue to the app if user agrees
                    NavigationLink(destination: GamesMenuView()) {
                        Text("Agree")
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
        // Hides default back button to prevent going back to intro screen
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PolicyView()
}
