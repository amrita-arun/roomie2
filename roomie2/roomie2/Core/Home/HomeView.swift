//
//  HomeView.swift
//  roomie2
//
//  Created by Administrator on 8/7/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showLoginView = false


    var body: some View {
        Text("Inside Home!")
        Button(action: {
            // Handle login action here
            // For now, we'll simply navigate to the ProfileFormView
            Task {
               viewModel.signOut()
           }
            //showingProfileForm = true
        }) {
            Text("Sign Out")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(5.0)
        }
        .padding(.top, 20)
        .onChange(of: viewModel.userLoggedIn) { loggedIn in
            if !loggedIn {
                showLoginView = true
            }
        }
        .navigationDestination(isPresented: $showLoginView) {
            LogInView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
