//
//  SettingsView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 03.02.2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("beautifulBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                    .padding(.top, -95)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                VStack {
                    Text("Some cool app description")
                        .foregroundColor(.gray)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Button("Log Out") {
                        
                    }
                    .padding(.bottom, 60)
                    
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
