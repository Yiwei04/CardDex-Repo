//
//  ContentView.swift
//  CardDex
//
//  Created by Jeffery Wang on 22/4/2025.
//

import SwiftUI
import UIKit
import AVFoundation

struct ContentView: View {
    @State var ownedCards: OwnedCards = OwnedCards()
    private let player = AVPlayer(url: Bundle.main.url(forResource: "mainbackground", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack{
            ZStack{
                VideoBackgroundPlayer(player: player).ignoresSafeArea()
                VStack{
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                    Spacer()
                    NavigationLink(destination: PolicyView()) {
                        Text("Enter")
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
            ownedCards.shufflevalues()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
        .environmentObject(OwnedCards())
}
