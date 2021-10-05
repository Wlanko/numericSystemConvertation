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
    
    var textForInputNmericSystem = "Input numeric system"
    var textForInputNmber = "Input number"
    var textForOutputNumericSystem = "Output numeric system"
    var textForOutputNumber = "Output number"
    var textForButton = "Convert"
    
    var body: some View {
        VStack{
            HStack {
                TextFieldForNumericConversion(text: $inputNumericSystem, topLabel: textForInputNmericSystem, placeholderText: textForInputNmericSystem)
                    .keyboardType(.decimalPad)
                // castom view
                TextFieldForNumericConversion(text: $inputNumber, topLabel: textForInputNmber, placeholderText: textForInputNmber)
            }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                TextFieldForNumericConversion(text: $outputNumericSystem, topLabel: textForOutputNumber, placeholderText: textForOutputNumber)
                    .keyboardType(.decimalPad)
                TextFieldForNumericConversion(text: $outputNumber, topLabel: textForOutputNumber, placeholderText: textForOutputNumber)
            }
            
            
            
            Button(textForButton, action: {
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
            
            .padding(.top)
            
            Spacer()
        }.onTapGesture {
            
            self.hideKeyboard()
        }
    }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




