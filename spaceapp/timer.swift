//
//  timer.swift
//  spaceapp
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

struct timer: View {
    @State private var isPresentingGame = false
    @ObservedObject var timerManager = TimerManager()
    
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    var body: some View {
        VStack{
                NavigationView {
                    ZStack{
                    Color(red: 0.278, green: 0.339, blue: 0.342)
                            .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        Image("studytimer")
                        Text(secondsToMinutesAndSeconds(seconds: timerManager.secondsLeft))
                            .font(.system(size: 80))
                            .padding(.top, 80)
                            .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                            .fontWeight(.bold)
                        Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 180)
                            .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                            .onTapGesture(perform: {
                                if self.timerManager.timerMode == .initial {
                                    self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                                }
                                self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                            })
                        if timerManager.timerMode == .paused {
                            Image(systemName: "gobackward")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.top, 40)
                                .onTapGesture(perform: {
                                    self.timerManager.reset()
                                })
                        }
                        if timerManager.timerMode == .initial {
                            Picker(selection: $selectedPickerIndex, label: Text("")) {
                                ForEach(0 ..< availableMinutes.count) {
                                    Text("\(self.availableMinutes[$0]) min")
                                }
                            }
                            .labelsHidden()
                        }
                        Spacer()
                        
                        Button(action: {
                            isPresentingGame = true
                        }) {
                            Text("game")
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.738, green: 0.64, blue: 0.676))
                        }
                        .font(.title2)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.362, green: 0.217, blue: 0.298))
                        .sheet(isPresented: $isPresentingGame) {
                            game()
                    }
                }
                    
                    
                    
                
                
           
            }
            
          
            
    
            }
        }
    }
}

struct timer_Previews: PreviewProvider {
    static var previews: some View {
        timer()
    }
}
