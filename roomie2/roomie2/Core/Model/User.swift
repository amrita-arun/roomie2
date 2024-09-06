//
//  User.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class User: ObservableObject, Codable, CustomStringConvertible, Identifiable{
    @DocumentID var id: String? // This will store the Firestore document ID or Firebase Auth UID
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
    
    init() { }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        password = try container.decodeIfPresent(String.self, forKey: .password) ?? ""
        pronouns = try container.decodeIfPresent([String].self, forKey: .pronouns) ?? []
        chorePreferences = try container.decodeIfPresent([String].self, forKey: .chorePreferences) ?? []
        availability = try container.decodeIfPresent([String].self, forKey: .availability) ?? []
        cookingPref = try container.decodeIfPresent([String].self, forKey: .cookingPref) ?? []
        dietaryPref = try container.decodeIfPresent([String].self, forKey: .dietaryPref) ?? []
        noiseLevels = try container.decodeIfPresent([String].self, forKey: .noiseLevels) ?? []
        guestFreq = try container.decodeIfPresent([String].self, forKey: .guestFreq) ?? []
        guestPref = try container.decodeIfPresent([String].self, forKey: .guestPref) ?? []
        communicationPref = try container.decodeIfPresent([String].self, forKey: .communicationPref) ?? []
    }
        /*
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
         */
    //}
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(pronouns, forKey: .pronouns)
        try container.encode(chorePreferences, forKey: .chorePreferences)
        try container.encode(availability, forKey: .availability)
        try container.encode(cookingPref, forKey: .cookingPref)
        try container.encode(dietaryPref, forKey: .dietaryPref)
        try container.encode(noiseLevels, forKey: .noiseLevels)
        try container.encode(guestFreq, forKey: .guestFreq)
        try container.encode(guestPref, forKey: .guestPref)
        try container.encode(communicationPref, forKey: .communicationPref)
        /*
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
*/
    }
    
    var description: String {
        return """
        User(
            name: \(name),
            email: \(email),
            password: \(password),
            pronouns: \(pronouns),
            chorePreferences: \(chorePreferences),
            availability: \(availability),
            cookingPreferences: \(cookingPref),
            dietaryPreferences: \(dietaryPref),
            noiseLevels: \(noiseLevels),
            guestFrequency: \(guestFreq),
            guestPreferences: \(guestPref),
            communicationPreferences: \(communicationPref)
        )
        """
    }
     
    // Add other properties as needed
}
