//
//  SplashScreen.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 10/255, green: 10/255, blue: 15/255),
                    Color(red: 20/255, green: 15/255, blue: 35/255)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
               
                Image("boo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    .padding(.bottom, 10)
                
            
                Text("Journali")
                    .font(.system(size: 36, weight: .heavy))
                    .foregroundColor(.white)
                
              
                Text("Your thoughts, your story")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color.white.opacity(0.8))
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SplashScreen()
}
