//
//  UserModel.swift
//  QiitaSwiftUIApp
//
//  Created by 橋元雄太郎 on 2023/05/14.
//

import Foundation

struct Qiita: Codable, Identifiable {
    let id: String
    let title: String
    let createdAt: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
        case createdAt = "created_at"
        case user = "user"
    }
}

struct User: Codable {
    let id: String
    let name: String
    let profileImageUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}
