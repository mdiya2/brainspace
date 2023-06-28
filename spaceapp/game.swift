//
//  game.swift
//  spaceapp
//
//  Created by Scholar on 6/28/23.
//

import SwiftUI

struct game: View {
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var guessedNumber = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.278, green: 0.339, blue: 0.342)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.278, green: 0.339, blue: 0.342))
                
                Image("gameTitle")
                    .resizable()
                    .imageScale(.small)
                    .aspectRatio(contentMode: .fit)
                Text("i'm thinking of a number between 1 and 100.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("enter your guess", text: $guessedNumber)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("check", action: checkGuess)
                    .padding()
                
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
        
        func checkGuess() {
            guard let guessedValue = Int(guessedNumber) else {
                showAlert(title: "invalid Input", message: "please enter a valid number.")
                return
            }
            
            if guessedValue == targetNumber {
                showAlert(title: "congratulations!", message: "you guessed it right!")
                resetGame()
            } else if guessedValue < targetNumber {
                showAlert(title: "wrong guess", message: "try a higher number.")
            } else {
                showAlert(title: "wrong Guess", message: "try a lower number.")
            }
        }
        
        func resetGame() {
            targetNumber = Int.random(in: 1...100)
            guessedNumber = ""
        }
        
        func showAlert(title: String, message: String) {
            alertTitle = title
            alertMessage = message
            showAlert = true
        }
    }


struct game_Previews: PreviewProvider {
    static var previews: some View {
        game()
    }
}
