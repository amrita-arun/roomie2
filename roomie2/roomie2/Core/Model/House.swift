//
//  House.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
//

import Foundation
import FirebaseFirestoreSwift

class House: Codable, Identifiable, ObservableObject {
//    @DocumentID var id: String?
    @Published var name = ""
    @Published var members: [User] = [] // Array of user IDs
    @Published var createdBy: User // ID of the user who created the house
    @Published var createdAt: Date
    
    init(name: String, createdBy: User, createdAt: Date = Date()) {
        self.name = name
        self.members = [createdBy] // Initialize with the creator as the first member
        self.createdBy = createdBy
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case members
        case createdBy
        case createdAt
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(members, forKey: .members)
        try container.encode(createdBy, forKey: .createdBy)
        try container.encode(createdAt, forKey: .createdAt)
    }
    
    required init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        members = try container.decodeIfPresent([User].self, forKey: .members) ?? []
        createdBy = try container.decodeIfPresent(User.self, forKey: .createdBy) ?? User()
        createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt) ?? Date()
    }
}
