//
//  LibraryAlbumsResponse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 29/8/23.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [AlbumUser]
}

struct AlbumUser: Codable {
    let added_at: String
    let album: Album
}
