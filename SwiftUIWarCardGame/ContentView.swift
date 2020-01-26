//
//  ContentView.swift
//  SwiftUIWarCardGame
//
//  Created by Aurélien Girault on 26/01/2020.
//  Copyright © 2020 Aurélien Girault. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber1 = 0
    @State private var randomNumber2 = 0
    
    @State private var playerScore = 0
    @State private var CPUScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                    .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    if randomNumber1 == 0 && randomNumber2 == 0 {
                        Image("back")
                        Image("back")
                    }
                    else {
                        Image("card\(String(randomNumber1))")
                        Image("card\(String(randomNumber2))")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.randomNumber1 = Int.random(in: 2...14)
                    self.randomNumber2 = Int.random(in: 2...14)
                    
                    if self.randomNumber1 > self.randomNumber2 {
                        self.playerScore += 1
                    }
                    if self.randomNumber2 > self.randomNumber1 {
                        self.CPUScore += 1
                    }
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(playerScore))
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(CPUScore))
                    }
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
