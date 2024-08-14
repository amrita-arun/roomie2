//
//  HomeView.swift
//  roomie2
//
//  Created by Administrator on 8/7/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showLoginView = false
    @State var user: User

    var body: some View {
        VStack {
            Text("Inside Home!")
            
            Button(action: {
                Task {
                   viewModel.signOut()
               }
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
        .onAppear {
            Task {
                self.user = await viewModel.populateUser(email: self.viewModel.getUserEmail())
                //self.user = viewModel.user ?? User()
            }
        }
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Information:")
                Text(user.name)
                Text(user.email)
                Text(user.password)

                PreferenceSection(title: "Pronouns", preferences: user.pronouns)
                PreferenceSection(title: "Chore Preferences", preferences: user.chorePreferences)
                PreferenceSection(title: "Availability", preferences: user.availability)
                PreferenceSection(title: "Cooking Preferences", preferences: user.cookingPref)
                PreferenceSection(title: "Dietary Preferences", preferences: user.dietaryPref)
                
            }
            VStack(alignment: .leading, spacing: 10) {
                PreferenceSection(title: "Noise Levels", preferences: user.noiseLevels)
                PreferenceSection(title: "Guest Frequency", preferences: user.guestFreq)
                PreferenceSection(title: "Guest Preferences", preferences: user.guestPref)
                PreferenceSection(title: "Communication Preferences", preferences: user.communicationPref)
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User())
    }
}
