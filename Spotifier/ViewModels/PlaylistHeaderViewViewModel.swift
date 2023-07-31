//
//  PlaylistHeaderViewViewModel.swift
//  Spotifier
//
//  Created by Edu Caubilla on 31/7/23.
//

import Foundation

struct PlaylistHeaderViewViewModel: Codable {
    let name: String?
    let ownerName: String?
    let description: String?
    let artworkURL: URL?
}
