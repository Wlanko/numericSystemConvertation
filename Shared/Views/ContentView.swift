//
//  ContentView.swift
//  Shared
//
//  Created by Vlad Kyrylenko on 25.09.2021.
//

import SwiftUI
import Firebase
import FirebaseCore

@available(iOS 15.0.0, *)
struct ContentView: View {
    @State var inputNumber: String = ""
    @State var outputNumber: String = ""
    @State var inputNumericSystem: String = ""
    @State var outputNumericSystem: String = ""
    @State var showingAlert: Bool = false
    @State var message: String = ""
    @State var goToSettingsView: Bool = false
    
    let textForInputNumericSystem = "Input numeric system"
    let textForInputNumber = "Input number"
    let textForOutputNumericSystem = "Output numeric system"
    let textForOutputNumber = "Output number"
    let textForButton = "Convert"
    let unremovablePrefix = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack {
                    FourTextFieldPattern(inputparameter: $inputNumericSystem, outputparameter: $outputNumericSystem, input: $inputNumber, output: $outputNumber, textForInputParameter: textForInputNumericSystem, textForInput: textForInputNumber, textForOutputParameter: textForOutputNumericSystem, textForOutput: textForOutputNumber)
                    
                    
                        NavigationLink(destination: SettingsView()
                                        .navigationBarTitleDisplayMode(.inline)
                                        .navigationBarHidden(true),
                                       isActive: $goToSettingsView) { EmptyView() }
                    
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
                .navigationTitle("Conversion")
                .toolbar{
                    Button(action: {
                        goToSettingsView = true
                    }) {
                        Image("GearImage")
                    }
                }
                .background(BeautifulBackground())
                
                .contentShape(Rectangle())
                .onTapGesture {
                    self.hideKeyboard()
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
    }
}
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}


@available(iOS 15.0.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




