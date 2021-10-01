//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Kyrylenko on 25.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber: String = ""
    @State var outputNumber: String = ""
    @State var inputNumericSystem: String = ""
    @State var outputNumericSystem: String = ""
    
    var convertationHelper = ConvertationHelper()
    
    
    
    var body: some View {
        
        VStack{
            var inputNumericSystemTextField = TextFieldForNumericConversion(text: inputNumericSystem)
            HStack {// lables
                
                
                VStack(alignment: .leading, spacing: -2.0) {
                    Text("Input numeric system")
                        .font(.system(size: 16))
                        .padding(.leading, 5)
                    TextField("Input NS", text: $inputNumericSystem)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(5)
                } // castom view
                TextField("Input number", text: $inputNumber)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(5)
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                TextField("Output NS", text: $outputNumericSystem)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(5)
                
                
                
                TextField(outputNumber, text: $outputNumber)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(5)
            }
            
            HStack {
                Button("Convert", action: {
                    outputNumber = convertationHelper.numericConvertation(iNum: inputNumber, iNS: inputNumericSystem, oNS: outputNumericSystem)
                })
            }
            .padding(.top)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




