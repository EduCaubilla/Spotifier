//
//  AllCategoriesResponse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 10/8/23.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable{
    let id: String
    let name: String
    let icons: [APIImage]
}
