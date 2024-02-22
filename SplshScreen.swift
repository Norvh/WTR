//
//  SplashScreen.swift
//  Pit-a-Pat
//
//  Created by Faizah Almalki on 17/07/1445 AH.
//

import SwiftUI

    struct SplashScreen: View {
        @State private var showSplash = true
        @State private var isActive = false
        
        var body: some View {
            ZStack {
                Color.white
                    .ignoresSafeArea(.all)
                
                if showSplash {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .foregroundColor(Color("lightBlue"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 70)
                        .padding(.leading)
                        .offset(y: 30)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.showSplash = false
                                self.isActive = true
                            }
                        }
                } else {
                    if isActive {
                        NavigationStack {
                          
ContentView()
                            
                        }
                        .navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }
    }

    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen()
        }
    }

    

#Preview {
    SplashScreen()
}
