//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Richárd Pohner on 28.11.24.
//

import SwiftUI

struct ContentView: View {
    @State private var rockPaperScissor: [String] = ["trash", "paperplane", "scissors"]
    @State private var randomIndex: Int = Int.random(in: 0..<3)
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    @State private var score: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("The famous Trash, Paper, Scissors Game")
                    .font(.largeTitle.weight(.bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Please pick a counter")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text("Enemy choose \(rockPaperScissor[randomIndex])")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                    }
                    ForEach(0..<3) { index in
                        Button() {
                            pickCounter(index)
                            newRandomPick()
                        } label: {
                            Image(systemName: rockPaperScissor[index])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding()
                
                VStack{
                    Text("Current score is: \(score)")
                }
            }
        }
/*        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newRandomPick)
        } message: {
            Text("The score is: \(score)")
        }*/
    }
    
    func pickCounter(_ number: Int) {
        let ourPick: String = rockPaperScissor[number]
        
        switch ourPick {
            case "trash":
            if rockPaperScissor[randomIndex] == "trash" {
                scoreTitle = "Draw"
            } else if rockPaperScissor[randomIndex] == "paperplane" {
                scoreTitle = "Enemy Won"
                score -= 1
            } else {
                scoreTitle = "You Won"
                score += 1
            }
        case "paperplane":
            if rockPaperScissor[randomIndex] == "trash" {
                scoreTitle = "You Won"
                score += 1
            } else if rockPaperScissor[randomIndex] == "paperplane" {
                scoreTitle = "Draw"
            } else {
                scoreTitle = "Enemy won"
                score -= 1
            }
        case "scissors":
            if rockPaperScissor[randomIndex] == "trash" {
                scoreTitle = "Enemy Won"
                score -= 1
            } else if rockPaperScissor[randomIndex] == "paperplane" {
                scoreTitle = "You won"
                score += 1
            } else {
                scoreTitle = "Draw"
            }
        default:
            scoreTitle = "Error"
        }
        showingScore = true
    }
    
    func newRandomPick() {
        randomIndex = Int.random(in: 0..<3)
    }
    
}

#Preview {
    ContentView()
}
