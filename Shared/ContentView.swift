//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Kyrylenko on 25.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var iNum: String = ""
    @State var oNum: String = ""
    @State var iNS: String = ""
    @State var oNS: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            HStack {
                TextField("Input NS", text: $iNS)
                    .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .padding(5)
                TextField("Input number", text: $iNum)
                    .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .padding(5)
            }
            
            HStack {
                TextField("Output NS", text: $oNS)
                    .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .padding(5)
                    
                    
                
                TextField(oNum, text: $oNum)
                    .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .padding(5)
            }
            
            HStack {
                Button("Convert", action: {
                    oNum = convertation(iNum: iNum, iNS: iNS, oNS: oNS)
                })
            }
            .padding(.top)
            
            Spacer()
            
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
