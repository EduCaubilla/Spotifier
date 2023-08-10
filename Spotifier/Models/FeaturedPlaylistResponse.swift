//
//  FeaturedPlaylistResponse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 27/7/23.
//

import Foundation


struct FeaturedPlaylistResponse : Codable {
    let playlists: PlaylistResponse
    let message: String
}

struct CategoryPlaylistResponse : Codable {
    let playlists: PlaylistResponse
    let message: String?
}

struct PlaylistResponse : Codable{
    let items: [Playlist]
}

struct User: Codable{
    let display_name: String
    let external_urls: [String: String]
    let href : String
    let id : String
    let uri : String
}
