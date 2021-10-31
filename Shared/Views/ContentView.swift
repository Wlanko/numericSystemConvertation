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
    
    let textForInputNumericSystem = "Input numeric system"
    let textForInputNumber = "Input number"
    let textForOutputNumericSystem = "Output numeric system"
    let textForOutputNumber = "Output number"
    let textForButton = "Convert"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .bottom) {
                    TextFieldPattern(text: $inputNumericSystem, topLabel: textForInputNumericSystem, placeholderText: textForInputNumericSystem)
                        .keyboardType(.decimalPad)
                    // custom view
                    TextFieldPattern(text: $inputNumber, topLabel: textForInputNumber, placeholderText: textForInputNumber)
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                HStack(alignment: .bottom) {
                    TextFieldPattern(text: $outputNumericSystem, topLabel: textForOutputNumber, placeholderText: textForOutputNumber)
                        .keyboardType(.decimalPad)
                    TextFieldPattern(text: $outputNumber, topLabel: textForOutputNumber, placeholderText: textForOutputNumber)
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
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .contentShape(Rectangle())
        .onTapGesture {
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




