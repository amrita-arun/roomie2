//
//  ProfileView.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Profile")
                    .font(.largeTitle)
                    .padding(.bottom, 20)

                ProfileSection(title: "Name", content: user.name)
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
                
                Spacer()
            }
            .padding()
            .navigationTitle("Your Profile")
        }
    }
}

struct ProfileSection: View {
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top, 10)

            Text(content)
                .padding(.leading, 10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(User())
    }
}

