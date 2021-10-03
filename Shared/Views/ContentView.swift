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
    @State var showingAlert: Bool = false
    @State var message: String = ""
    
    var body: some View {
        
        VStack{
            HStack {
                TextFieldForNumericConversion(text: $inputNumericSystem, topLabel: "Input numeric system", placeholderText: "Input Numeric System")
                 // castom view
                TextFieldForNumericConversion(text: $inputNumber, topLabel: "Input number", placeholderText: "Input Number")
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                TextFieldForNumericConversion(text: $outputNumericSystem, topLabel: "Output numeric system", placeholderText: "Output Numeric System")
                TextFieldForNumericConversion(text: $outputNumber, topLabel: "Output number", placeholderText: "Output Number")
            }
            
            
            
            HStack {
                Button("Convert", action: {
                    do {
                        outputNumber = try ConvertationHelper.numericConvertation(iNum: inputNumber,
                                                                                  iNS: inputNumericSystem,
                                                                                  oNS: outputNumericSystem)
                    } catch {
                        message = error.localizedDescription
                        showingAlert = true
                    }
                }).alert(isPresented: $showingAlert, content: {
                    Alert(
                        title: Text("Error"),
                        message: Text(message)
                    )
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




