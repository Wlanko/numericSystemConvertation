//
//  SettingsView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 07.11.2021.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SettingsView: View {
    let logOutButtonText = "Log Out"
    @State var showLogOutAlert: Bool = false
    var authWithFirebase = AuthWithPhoneNumber()
    @State var showLogInView: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("beautifulBackgroundImage")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .frame(width: geometry.size.width,height: (geometry.size.height * 0.7))
                            .padding(.top, -10)
                        Spacer()
                    }.ignoresSafeArea()
                    
                    VStack {
                        Text("Application for converting numbers to different base from different base")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        Text("* Imagine some cool liryc description *")
                            .foregroundColor(.white)
                            .padding(.top)
                        
                        NavigationLink(destination: EnterPhoneNumber()
                                        .navigationTitle("LogIn")
                                        .navigationBarHidden(true),
                                       isActive: $showLogInView) { EmptyView() }
                        
                        Spacer()
                        
                        Button(logOutButtonText, action: {
                            showLogOutAlert = true
                        }).alert(isPresented: $showLogOutAlert, content: {
                            Alert(
                                title: Text("Log Out"),
                                message: Text("Are you sure you want to log out? After log out aplication must be reopened"),
                                primaryButton: .destructive(Text("YES")) {
                                    showLogInView = true
                                    authWithFirebase.signOutUser()
                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                                     exit(0)
                                                 }
                                },
                                secondaryButton: .cancel(Text("NO"))
                            )
                        })
                            .padding(.bottom, 20)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                }
            }
        }
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
