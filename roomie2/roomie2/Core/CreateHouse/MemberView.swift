//
//  MemberView.swift
//  roomie2
//
//  Created by Administrator on 9/6/24.
//

import SwiftUI

struct MemberView: View {
    @State var user: User
    @State var house: House
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            ForEach(self.house.members) { member in
                let _ = viewModel.printHouseMember(newUser: member)

                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Information:")
                        //print("In MemberView. User Info:")
                        
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
        .onAppear {
            Task {
                self.house = await viewModel.fetchHouse(houseName: user.house)
            }
        }
        
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(user: User(), house: House(name: "", createdBy: User()))
    }
}
