//
//  UserProfile.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation


struct UserProfile : Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
    let id: String
    let images: [UserImage?]
    let product: String
}

struct UserImage: Codable{
    let url: String
}


//JSON Example

//{
//    country = ES;
//    "display_name" = paco;
//    email = "paco@mail.es";
//    "explicit_content" =     {
//        "filter_enabled" = 0;
//        "filter_locked" = 0;
//    };
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/user/paco";
//    };
//    followers =     {
//        href = "<null>";
//        total = 0;
//    };
//    href = "https://api.spotify.com/v1/users/paco";
//    id = pacoPAQUÍ;
//    images =     (
//    );
//    product = free;
//    type = user;
//    uri = "spotify:user:eduardo79";
//}
