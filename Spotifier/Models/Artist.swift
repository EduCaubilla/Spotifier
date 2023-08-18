//
//  Artist.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation

struct Artist : Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let uri: String
    let external_urls: [String: String]
}
