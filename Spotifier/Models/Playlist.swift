//
//  Playlist.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation

struct Playlist : Codable {
    let description : String
    let external_urls: [String: String]
    let id : String
    let images: [APIImage]
    let name: String
    let owner: User
}
