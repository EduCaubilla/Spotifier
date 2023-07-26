//
//  SettingsModels.swift
//  Spotifier
//
//  Created by Edu Caubilla on 25/07/2023.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
