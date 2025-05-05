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
        ZStack{
            VideoBackgroundPlayer(player: player).ignoresSafeArea()
            VStack{
                Spacer()
                Text("Policy goes here")
                    .foregroundStyle(.white)
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
}

#Preview {
    PolicyView()
}
