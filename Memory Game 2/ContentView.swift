//
//  ContentView.swift
//  Memory Game 2
//
//  Created by Cecilia Curlango on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🦇","😈","🍭","⚰️","🦉","👹","💀","🎃","🧌","🦹🏻‍♀️","🕷️"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .imageScale(.small)
        .padding()
    } // end of var body : some View
    
    var cardCountAdjusters : some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    var cards : some View {
        HStack{
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardRemover : some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
        } label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        }
    }
    
    var cardAdder : some View {
        Button {
            if cardCount < emojis.count {
                cardCount += 1
            }
        } label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        }
    }
}

struct CardView: View {
    @State var isFaceup = true
    var content : String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceup {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceup.toggle()
        }
    }
}		

#Preview {
    ContentView()
}
