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
            VStack {
                Text("Some cool app description")
                    .foregroundColor(.gray)
                    .padding(.top, 40)
                
                Spacer()
                
                NavigationLink(destination: EnterPhoneNumber()
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarHidden(true),
                               isActive: $goToLogInScreen) { EmptyView() }
                
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
            .background(BeautifulBackground())
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
