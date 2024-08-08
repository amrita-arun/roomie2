//
//  User.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation

class User: ObservableObject {
    @Published var name = ""
    @Published var pronouns: [String] = []
    @Published var email = ""
    @Published var password = ""
    @Published var chorePreferences: [String] = []
    @Published var availability: [String] = []
    @Published var cookingPref: [String] = []
    @Published var dietaryPref: [String] = []
    @Published var noiseLevels: [String] = []
    @Published var guestFreq: [String] = []
    @Published var guestPref: [String] = []
    @Published var communicationPref: [String] = []


    // Add other properties as needed
}
