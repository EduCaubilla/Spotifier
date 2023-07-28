//
//  Artist.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation

struct Artist : Codable {
    let external_urls : [String: String]
    let id : String
    let name : String
    let uri : String
}
