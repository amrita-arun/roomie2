//
//  MemberView.swift
//  roomie2
//
//  Created by Administrator on 9/6/24.
//

import SwiftUI

struct MemberView: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var house: House
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(house.members) { member in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Information:")
                        Text(member.name)
                        Text(member.email)
                        Text(member.password)
                        
                        PreferenceSection(title: "Pronouns", preferences: member.pronouns)
                        PreferenceSection(title: "Chore Preferences", preferences: member.chorePreferences)
                        PreferenceSection(title: "Availability", preferences: member.availability)
                        PreferenceSection(title: "Cooking Preferences", preferences: member.cookingPref)
                        PreferenceSection(title: "Dietary Preferences", preferences: member.dietaryPref)
                        
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        PreferenceSection(title: "Noise Levels", preferences: member.noiseLevels)
                        PreferenceSection(title: "Guest Frequency", preferences: member.guestFreq)
                        PreferenceSection(title: "Guest Preferences", preferences: member.guestPref)
                        PreferenceSection(title: "Communication Preferences", preferences: member.communicationPref)
                    }
                }
            }
        }
        
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView()
    }
}
