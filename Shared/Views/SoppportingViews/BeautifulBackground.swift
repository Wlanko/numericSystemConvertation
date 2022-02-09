//
//  BeautifulBackground.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 09.02.2022.
//

import SwiftUI

struct BeautifulBackground: View {
    var body: some View {
        ZStack {
            Image("beautifulBackgroundImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                .padding(.top, -95)
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct BeautifulBackground_Previews: PreviewProvider {
    static var previews: some View {
        BeautifulBackground()
    }
}
