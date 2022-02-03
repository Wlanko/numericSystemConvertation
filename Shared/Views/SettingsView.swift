//
//  SettingsView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 03.02.2022.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SettingsView: View {
    @State var showLogOutAlert: Bool = false
    @State var goToLogInScreen: Bool = false
    let authWithPhoneNumber = AuthWithPhoneNumber()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("beautifulBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                    .padding(.top, -95)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                
                NavigationLink(destination: EnterPhoneNumber()
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarHidden(true),
                               isActive: $goToLogInScreen) { EmptyView() }
                
                VStack {
                    Text("Some cool app description")
                        .foregroundColor(.gray)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Button("Log Out") {
                        showLogOutAlert = true
                    }
                    .alert(isPresented: $showLogOutAlert){
                        Alert(
                            title: Text("Log out"),
                            message: Text("Are you sure you wnt to log out?"),
                            primaryButton: .destructive(Text("YESS")) {
                                authWithPhoneNumber.logOut()
                                goToLogInScreen = true
                            },
                            secondaryButton: .cancel(Text("NO"))
                        )
                    }
                    .padding(.bottom, 60)
                    
                }
                
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Back") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                
            }
        }
        .gesture(
            DragGesture()
                .onEnded() {_ in
                    presentationMode.wrappedValue.dismiss()
                }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0.0, *) {
            SettingsView()
        } else {
            // Fallback on earlier versions
        }
    }
}
