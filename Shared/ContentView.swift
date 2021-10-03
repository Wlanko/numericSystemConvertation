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
    
    var convertationHelper = ConvertationHelper()
    
    
    
    var body: some View {
        
        VStack{
            // let inputNumericSystemTextField = TextFieldForNumericConversion(text: inputNumericSystem)
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
                    do {
                        outputNumber = try convertationHelper.numericConvertation(iNum: inputNumber, iNS: inputNumericSystem, oNS: outputNumericSystem)
                    } catch ErrorForNumericConversion.invalidInput{
                        showingAlert = true
                        message = "Bad Input"
                    } catch ErrorForNumericConversion.wrongNumericSystem{
                        showingAlert = true
                        message = "Check numeric sysytem boxes"
                    } catch {
                        showingAlert = true
                        message = "Uncknown Error"
                    }
                }).alert(isPresented: $showingAlert, content: {
                    Alert(
                        title: Text("Bad Input"),
                        message: Text("Be careful next time")
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




