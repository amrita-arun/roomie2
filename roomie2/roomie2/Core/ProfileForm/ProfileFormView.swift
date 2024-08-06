//
//  ProfileFormView.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation

import SwiftUI
import SwiftUIFlowLayout

struct Option: Identifiable {
    var id = UUID()
    var name: String
}

struct ProfileFormView : View {
    @EnvironmentObject var user: User
    @State var name: String
    @State var username: String
    @State var password: String

    let pronouns = [
        Option(name: "she"),
        Option(name: "he"),
        Option(name: "they")
    ]
        
    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("What's your name?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                TextField(
                    "Jane Doe",
                    text: self.$user.name
                ).padding()
                
                Text("Pronouns?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: pronouns, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.pronouns.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.pronouns.append(option.name)
                            } else {
                                self.user.pronouns.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                
                Text("Username")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                TextField(
                    "janedoe",
                    text: self.$user.username
                )
                .padding()
                .autocapitalization(.none)
                
                Text("Password")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                SecureField(
                    "ProteinPowder123",
                    text: self.$user.password
                )
                .padding()
                .autocapitalization(.none)

                HStack(alignment: .center) {
                    NavigationLink("Continue", destination: ScreenTwo().environmentObject(user))
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 30)
                        .disabled(self.user.name.isEmpty || self.user.pronouns.isEmpty || self.user.username.isEmpty || self.user.password.isEmpty)
                }
            }
            .padding()
            .navigationTitle("Roomie Setup")
    
            Spacer()
        }
    }
}



struct ScreenTwo: View {
    @EnvironmentObject var user: User

    let choreSet = [
        Option(name: "Cleaning Bathroom"),
        Option(name: "Cleaning Kitchen"),
        Option(name: "Cleaning Living Room"),
        Option(name: "Washing Dishes"),
        Option(name: "Taking Out the Trash"),
        Option(name: "Vacuuming/Sweeping"),
        Option(name: "Yard Work"),
        Option(name: "Watering Plants")
    ]
    
    let weekdays = [
        Option(name: "Mon"),
        Option(name: "Tues"),
        Option(name: "Wed"),
        Option(name: "Thurs"),
        Option(name: "Fri"),
        Option(name: "Sat"),
        Option(name: "Sun")
    ]
    
    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("What chores do you prefer?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: choreSet, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.chorePreferences.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.chorePreferences.append(option.name)
                            } else {
                                self.user.chorePreferences.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                Text("What's your availability?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: weekdays, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.availability.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.availability.append(option.name)
                            } else {
                                self.user.availability.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                
                HStack(alignment: .center) {
                    NavigationLink("Continue", destination: SecondScreen().environmentObject(user))
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 30)
                        .disabled(self.user.availability.isEmpty || self.user.chorePreferences.isEmpty || self.user.name.isEmpty || self.user.pronouns.isEmpty)
                        //.background(Color(red: 0.83, green: 0.83, blue: 0.83))
                }
                 
            }
            .padding()
            .navigationTitle("Roomie Setup")
    
            Spacer()
        }
            
    }

}

struct SecondScreen : View {
    @EnvironmentObject var user: User

    let cookingPreferences = [
        Option(name: "Yes"),
        Option(name: "No"),
        Option(name: "Depends")
    ]
    
    let dietaryPreferences = [
        Option(name: "No Preferences"),
        Option(name: "Vegetarian"),
        Option(name: "Vegetarian No Egg"),
        Option(name: "Vegan"),
        Option(name: "Gluten Free"),
        Option(name: "Pescetarian"),
        Option(name: "Nuts"),
        Option(name: "Gluten"),
        Option(name: "Dairy")
    ]
    
    let noiseLevels = [
        Option(name: "Prefer Quiet"),
        Option(name: "Can Tolerate Moderate Noise"),
        Option(name: "Enjoy Lively Atmosphere")
    ]
    
    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("Are you open to cooking for others or sharing meals occasionally?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: cookingPreferences, itemSpacing: 4) {option in
                        OptionButton(title: option.name, isSelected: Binding(
                            get: { self.user.cookingPref.contains(option.name) },
                            set: { selected in
                                if selected {
                                    self.user.cookingPref.append(option.name)
                                } else {
                                    self.user.cookingPref.removeAll { $0 == option.name }
                                }
                            }
                        ))
                }
                Text("Any dietary restrictions/preferences?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: dietaryPreferences, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.dietaryPref.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.dietaryPref.append(option.name)
                            } else {
                                self.user.dietaryPref.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                Text("How do you feel about noise levels in the living space?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: noiseLevels, itemSpacing: 4) { option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.noiseLevels.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.noiseLevels.append(option.name)
                            } else {
                                self.user.noiseLevels.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                HStack(alignment: .center) {
                    NavigationLink("Continue", destination: ThirdScreen().environmentObject(user))
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 30)
                        .disabled(self.user.noiseLevels.isEmpty || self.user.dietaryPref.isEmpty || self.user.cookingPref.isEmpty)
                }
            }
            .padding()
            .navigationTitle("Roomie Setup")
    
            Spacer()
        }
    }
}


struct ThirdScreen : View {
    @EnvironmentObject var user: User

    let guestFrequency = [
        Option(name: "Rarely"),
        Option(name: "Occasionally"),
        Option(name: "Frequently"),
    ]
    
    let guestPreferences = [
        Option(name: "No Overnight Guests"),
        Option(name: "Advance Notice"),
        Option(name: "Consideration During Quiet Hours"),
        Option(name: "Maximum Number of Guests")
    ]

    
    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("How often do you expect to have guests over?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: guestFrequency, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.guestFreq.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.guestFreq.append(option.name)
                            } else {
                                self.user.guestFreq.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                Text("Are there any restrictions or guidelines you have regarding guests?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: guestPreferences, itemSpacing: 4) { option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.guestPref.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.guestPref.append(option.name)
                            } else {
                                self.user.guestPref.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                HStack(alignment: .center) {
                    NavigationLink("Continue", destination: FourthScreen().environmentObject(user))
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 30)
                        .disabled(self.user.guestPref.isEmpty || self.user.guestFreq.isEmpty)
                    
                }
            }
        }
        .padding()
        .navigationTitle("Roomie Setup")

        Spacer()
        
    }
}

struct FourthScreen : View {
    @EnvironmentObject var user: User

    let communicationPreferences = [
        Option(name: "Household Rules and Expectations"),
        Option(name: "Conflict Resolution"),
        Option(name: "Financial Matters"),
        Option(name: "Changes to Living Arrangements"),
        Option(name: "Safety and Security"),
        Option(name: "Personal Boundaries"),
        Option(name: "Special Events or Celebrations"),
        Option(name: "Emotional Support"),
        Option(name: "Celebrating Achievements"),
        Option(name: "Feedback or Suggestions"),
        Option(name: "Asking for favors")
    ]
    

    
    var body: some View {
        NavigationStack() {
            VStack(alignment: .leading) {
                Text("Are there specific topics or issues you prefer to discuss in person rather than through messaging?")
                    .padding(.top, 16)
                    .padding(.horizontal, 9)
                FlowLayout(mode: .vstack, items: communicationPreferences, itemSpacing: 4) {option in
                    OptionButton(title: option.name, isSelected: Binding(
                        get: { self.user.communicationPref.contains(option.name) },
                        set: { selected in
                            if selected {
                                self.user.communicationPref.append(option.name)
                            } else {
                                self.user.communicationPref.removeAll { $0 == option.name }
                            }
                        }
                    ))
                }
                
                HStack(alignment: .center) {
                    NavigationLink("Finish", destination: PreferenceDisplay().environmentObject(user))
                        .frame(maxWidth: .infinity)
                        .buttonStyle(.bordered)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 30)
                        .disabled(self.user.communicationPref.isEmpty)
                    
                }
            }
        }
        .padding()
        .navigationTitle("Roomie Setup")

        Spacer()
        
    }
}

struct PreferenceDisplay: View {
    @EnvironmentObject var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                Text(user.username)
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
            .padding()
            .navigationTitle("Your Preferences")
        }
    }
}

struct PreferenceSection: View {
    let title: String
    let preferences: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.top, 10)

            ForEach(preferences, id: \.self) { preference in
                Text(preference)
                    .padding(.leading, 10)
            }
        }
    }
}


struct OptionButton: View {
    let id = UUID()
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(title)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(isSelected ? Color.yellow : Color(red: 0.83, green: 0.83, blue: 0.83))
                .foregroundColor(.black)
                .clipShape(Capsule())
        }
    }
    
    struct CircleToggleStyle: ToggleStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            Button(action: {
                configuration.isOn.toggle()
            }) {
                configuration.label
                    .padding()
                    .background(configuration.isOn ? Color.yellow : Color.gray)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
    }
    
    struct ProfileFormView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileFormView(name: "", username: "", password: "")
                .environmentObject(User()) // For the preview, this ensures the User object is provided

        }
    }
}
