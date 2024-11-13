//
//  ContentView.swift
//  Memory Game 2
//
//  Created by Cecilia Curlango on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🦇","😈","🍭"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
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
            isFaceup = !isFaceup
        }
    }
}		

#Preview {
    ContentView()
}
