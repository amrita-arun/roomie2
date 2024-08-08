//
//  LogInView.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation
import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingProfileForm = false
    @State private var showHomeView = false
        @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Roomie")
                    .font(.largeTitle)
                    .padding(.bottom, 40)

                TextField("email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                    .autocapitalization(.none)

                Button(action: {
                    // Handle login action here
                    // For now, we'll simply navigate to the ProfileFormView
                    Task {
                       viewModel.signIn(withEmail: email, password: password)
                   }
                    //showingProfileForm = true
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
                .padding(.top, 20)
                .disabled(email.isEmpty || password.isEmpty)
                
                Button(action: {
                    showingProfileForm = true
                }) {
                    Text("Don't have an account? Sign up!")
                        .padding()
                }
                .navigationDestination(isPresented: $showingProfileForm) {
                    ProfileFormView(name: "", email: "", password: "").environmentObject(User())
                }
                .onChange(of: viewModel.userLoggedIn) { loggedIn in
                        if loggedIn {
                            showHomeView = true
                            viewModel.userLoggedIn = false
                        }
                    }
                    .navigationDestination(isPresented: $showHomeView) {
                        HomeView()
                    }
                }.navigationBarBackButtonHidden(true)
                Spacer()
            }
            .padding()
        }
    }


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
