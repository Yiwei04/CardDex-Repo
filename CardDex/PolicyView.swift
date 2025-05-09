//
//  PolicyView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI
import UIKit
import AVFoundation

struct PolicyView: View {
    private let player = AVPlayer(url: Bundle.main.url(forResource: "mainbackground", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack{
            ZStack{
                VideoBackgroundPlayer(player: player).ignoresSafeArea()
                VStack{
                    Spacer()
                    //Logo
                    Spacer()
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PolicyView()
}
