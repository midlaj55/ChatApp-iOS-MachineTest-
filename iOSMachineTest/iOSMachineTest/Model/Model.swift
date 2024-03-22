//
//  Model.swift
//  iOSMachineTest
//
//  Created by Mc on 20/03/24.
//

struct GroupResponse: Codable {
    let message: String
    let result: ResultData
}

public struct ResultData: Codable, Hashable {
    let currentPage: Int?
    let groups: [GroupModel]?
    let nextPage: Bool?
    let total: Int?
}

struct GroupModel: Codable, Hashable, Identifiable {
    let bio: String
    let groupPhoto: String
    let id: Int
    let name: String
    let participantCount: Int
    let isPrivate: Bool
    let unreadCount: Int
    let userStatus: String

    enum CodingKeys: String, CodingKey {
        case bio
        case groupPhoto = "group_photo"
        case id
        case name
        case participantCount = "participant_count"
        case isPrivate = "private"
        case unreadCount = "unread_count"
        case userStatus = "user_status"
    }
}
