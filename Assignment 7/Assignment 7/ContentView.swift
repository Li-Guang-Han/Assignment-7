//
//  ContentView.swift
//  Assignment 7
//
//  Created by Garrett Li on 7/6/25.
//

import SwiftUI

struct EmojiCounter: Identifiable {
    let id = UUID()
    let emoji: String
    var count: Int
}

struct ContentView: View {
    @State private var emojiCounters: [EmojiCounter] = [
        EmojiCounter(emoji: "😀", count: 0),
        EmojiCounter(emoji: "🐶", count: 0),
        EmojiCounter(emoji: "🍕", count: 0)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach($emojiCounters) { $counter in
                    HStack {
                        Text(counter.emoji)
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            counter.count -= 1
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                        .buttonStyle(PlainButtonStyle()) // <-- important to avoid row tap interference
                        Text("\(counter.count)")
                            .frame(width: 40)
                        Button(action: {
                            counter.count += 1
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                        }
                        .buttonStyle(PlainButtonStyle()) // <-- important
                    }
                    .padding(.vertical, 8)
                    .contentShape(Rectangle()) // Defines tappable area but no tap gesture here
                    .listRowBackground(Color.clear) // Prevent row selection highlight
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Emoji Counter")
        }
    }
}

#Preview {
    ContentView()
}


