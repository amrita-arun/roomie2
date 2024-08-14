//
//  User.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation

class User: ObservableObject {//, Codable {
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

    /*
    enum CodingKeys: String, CodingKey {
        case name
        case pronouns
        case email
        case password
        case chorePreferences
        case availability
        case cookingPref
        case dietaryPref
        case noiseLevels
        case guestFreq
        case guestPref
        case communicationPref
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        email = try values.decode(String.self, forKey: .email)
        pronouns = try values.decode([String].self, forKey: .pronouns)
        password = try values.decode(String.self, forKey: .password)
        chorePreferences = try values.decode([String].self, forKey: .chorePreferences)
        availability = try values.decode([String].self, forKey: .availability)
        cookingPref = try values.decode([String].self, forKey: .cookingPref)
        dietaryPref = try values.decode([String].self, forKey: .dietaryPref)
        noiseLevels = try values.decode([String].self, forKey: .noiseLevels)
        guestFreq = try values.decode([String].self, forKey: .guestFreq)
        guestPref = try values.decode([String].self, forKey: .guestPref)
        communicationPref = try values.decode([String].self, forKey: .communicationPref)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(pronouns, forKey: .pronouns)
        try container.encode(email, forKey: .name)
        try container.encode(password, forKey: .password)
        try container.encode(chorePreferences, forKey: .chorePreferences)
        try container.encode(availability, forKey: .availability)
        try container.encode(cookingPref, forKey: .cookingPref)
        try container.encode(dietaryPref, forKey: .dietaryPref)
        try container.encode(noiseLevels, forKey: .noiseLevels)
        try container.encode(guestFreq, forKey: .guestFreq)
        try container.encode(guestPref, forKey: .guestPref)
        try container.encode(communicationPref, forKey: .communicationPref)

    }
     */
    // Add other properties as needed
}
