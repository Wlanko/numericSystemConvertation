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
                ZStack {
                    Image("beautifulBackgroundImage")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -95)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    NavigationLink(destination: SettingsView()
                                    .navigationBarTitleDisplayMode(.inline)
                                    .navigationBarHidden(true),
                                   isActive: $goToSettingsView) { EmptyView() }
                    
                    VStack {
                        HStack(alignment: .bottom) {
                            TextFieldPattern(text: $inputNumericSystem, topLabel: textForInputNumericSystem, placeholderText: textForInputNumericSystem, unremovablePrefix: unremovablePrefix)
                                .keyboardType(.decimalPad)
                            TextFieldPattern(text: $inputNumber, topLabel: textForInputNumber, placeholderText: textForInputNumber, unremovablePrefix: unremovablePrefix)
                        }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        
                        HStack(alignment: .bottom) {
                            TextFieldPattern(text: $outputNumericSystem, topLabel: textForOutputNumericSystem, placeholderText: textForOutputNumber, unremovablePrefix: unremovablePrefix)
                                .keyboardType(.decimalPad)
                            TextFieldPattern(text: $outputNumber, topLabel: textForOutputNumber, placeholderText: textForOutputNumber, unremovablePrefix: unremovablePrefix)
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
                    .navigationTitle("Conversion")
                    .toolbar{
                        Button(action: {
                            goToSettingsView = true
                        }) {
                            Image("GearImage")
                        }
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.hideKeyboard()
                }
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




