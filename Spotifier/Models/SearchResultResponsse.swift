//
//  SearchResultResponsse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 16/8/23.
//

import Foundation

struct SearchResultReponse : Codable {
    let albums: SearchAlbumsResponse
    let artists: SearchArtistsResponse
    let playlists: SearchPlaylistsResponse
    let tracks: SearchTracksResponse
}

struct SearchAlbumsResponse: Codable{
    let items: [Album]
}

struct SearchArtistsResponse: Codable{
    let items: [Artist]
}

struct SearchPlaylistsResponse: Codable{
    let items: [Playlist]
}

struct SearchTracksResponse: Codable{
    let items: [AudioTrack]
}
