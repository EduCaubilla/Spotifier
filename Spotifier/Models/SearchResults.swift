//
//  SearchResults.swift
//  Spotifier
//
//  Created by Edu Caubilla on 16/8/23.
//

import Foundation

enum SearchResult {
    case artist(model:Artist)
    case album(model:Album)
    case playlist(model:Playlist)
    case track(model:AudioTrack)
}
