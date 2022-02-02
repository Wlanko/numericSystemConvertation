//
//  SettingsView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 21.01.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct SettingsView: View {
    @State var showingAlert: Bool = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("beautifulBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                    .padding(.top, -32)
                
                VStack {
                    Text("Some cool app description")
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    Button("Log Out") {
                        showingAlert = true
                    }
                    .alert("authWithPhoneNumber.errorMessage", isPresented: $showingAlert, actions: {})
                    .padding(.bottom, 40)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Settings")
                .navigationBarBackButtonHidden(false)
                .toolbar(){
                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                        Button(action: { presentationMode.wrappedValue.dismiss() },
                               label: { Text("Back") })
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.hideKeyboard()
            }
            .gesture(
                DragGesture()
                    .onChanged(){_ in presentationMode.wrappedValue.dismiss()}
            )
        }
    }
}

@available(iOS 15.0, *)
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
