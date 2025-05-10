//
//  CardDetailsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct CardDetailsView: View {
    let card: Card

    var body: some View {
        ScrollView{
                VStack {
                    Color(red: 79/255, green: 23/255, blue: 108/255).ignoresSafeArea()
                    Image(card.imageName)
                        .resizable()
                        .frame(width: 275, height: 375)
                        .cornerRadius(14)
                        .padding()
                    
                    Text(card.name)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.bottom, 4)
                    
                    Text(String(format: "$%.2f", card.marketprice))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    CardDetailsView(card: Card(name: "Sample Card", marketprice: 123.45, imageName: "SampleImage"))
}

