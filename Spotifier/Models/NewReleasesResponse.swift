//
//  NewReleasesResponse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 27/7/23.
//

import Foundation


struct NewReleasesResponse : Codable {
    let albums : AlbumsResponse
}

struct AlbumsResponse: Codable{
    let items: [Album]
    let href: String
    let limit: Int
    let next: String
    let offset: Int
    let total: Int
}

struct Album : Codable{
    let album_type: String
    let artists : [Artist]
    let available_markets : [String]
    let href : String
    let id : String
    var images : [APIImage]
    let name : String
    let release_date : String
    let total_tracks : Int
    let type : String
    let uri : String
}

//JSON Example

//    {
//        albums =     {
//            href = "https://api.spotify.com/v1/browse/new-releases?country=ES&locale=es-US%2Ces-419%3Bq%3D0.9%2Ces%3Bq%3D0.8&offset=0&limit=1";
//            items =         (
//                {
//                    "album_type" = single;
//                    artists =                 (
//                        {
//                            "external_urls" =                         {
//                                spotify = "https://open.spotify.com/artist/1Mw40k757jZuiL0NIJpdO5";
//                            };
//                            href = "https://api.spotify.com/v1/artists/1Mw40k757jZuiL0NIJpdO5";
//                            id = 1Mw40k757jZuiL0NIJpdO5;
//                            name = GULEED;
//                            type = artist;
//                            uri = "spotify:artist:1Mw40k757jZuiL0NIJpdO5";
//                        },
//                    );
//                    "available_markets" =                 (
//                        AD,
//                        ...
//                        ZW
//                    );
//                    "external_urls" =                 {
//                        spotify = "https://open.spotify.com/album/5I4I0k75uiUnqyJvh7vxLC";
//                    };
//                    href = "https://api.spotify.com/v1/albums/5I4I0k75uiUnqyJvh7vxLC";
//                    id = 5I4I0k75uiUnqyJvh7vxLC;
//                    images =                 (
//                        {
//                            height = 640;
//                            url = "https://i.scdn.co/image/ab67616d0000b27331fc809752d7ad4732cd8bfd";
//                            width = 640;
//                        },
//                        {
//                            height = 300;
//                            url = "https://i.scdn.co/image/ab67616d00001e0231fc809752d7ad4732cd8bfd";
//                            width = 300;
//                        },
//                        {
//                            height = 64;
//                            url = "https://i.scdn.co/image/ab67616d0000485131fc809752d7ad4732cd8bfd";
//                            width = 64;
//                        }
//                    );
//                    name = "Cuando Menos Lo Espera";
//                    "release_date" = "2023-07-07";
//                    "release_date_precision" = day;
//                    "total_tracks" = 1;
//                    type = album;
//                    uri = "spotify:album:5I4I0k75uiUnqyJvh7vxLC";
//                }
//            );
//            limit = 1;
//            next = "https://api.spotify.com/v1/browse/new-releases?country=ES&locale=es-US%2Ces-419%3Bq%3D0.9%2Ces%3Bq%3D0.8&offset=1&limit=1";
//            offset = 0;
//            previous = "<null>";
//            total = 100;
//        };
//    }
