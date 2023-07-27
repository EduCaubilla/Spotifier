//
//  FeaturedPlaylistResponse.swift
//  Spotifier
//
//  Created by Edu Caubilla on 27/7/23.
//

import Foundation


struct FeaturedPlaylistResponse : Codable {
    let playlists: PlaylistResponse
    let message: String
}

struct PlaylistResponse : Codable{
    let items: [Playlist]
}

struct Playlist : Codable{
    let description : String
    let external_urls: [String: String]
    let id : String
    let images: [APIImage]
    let name: String
    let owner: User
}

struct User: Codable{
    let display_name: String
    let external_urls: [String: String]
    let href : String
    let id : String
    let uri : String
}


//Example JSON

//{
//    message = "#TBT con los cl\U00e1sicos";
//    playlists =     {
//        href = "https://api.spotify.com/v1/browse/featured-playlists?country=ES&timestamp=2023-07-27T15%3A48%3A25&offset=0&limit=2";
//        items =         (
//                        {
//                collaborative = 0;
//                description = "The biggest songs of the 1980s.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DX4UtSsGT1Sbe";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX4UtSsGT1Sbe";
//                id = 37i9dQZF1DX4UtSsGT1Sbe;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f00000003398887419dd1a747769450e4";
//                        width = "<null>";
//                    }
//                );
//                name = "All Out 80s";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTY5MDQ3MDA2MSwwMDAwMDAwMGY3ZGU4MDRlNjA1MWQyYWQwN2I5YzlkM2E1OWQxMjQ0;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX4UtSsGT1Sbe/tracks";
//                    total = 150;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DX4UtSsGT1Sbe";
//            },
//                        {
//                collaborative = 0;
//                description = "Lo mejor de la primera d\U00e9cada del milenio.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DXb0AsvHMF4aM";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXb0AsvHMF4aM";
//                id = 37i9dQZF1DXb0AsvHMF4aM;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f000000035382c4f48bb33904a9a47014";
//                        width = "<null>";
//                    }
//                );
//                name = "Los 2000 Espa\U00f1a";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTY4NjkyMTA2MywwMDAwMDAwMDcyMTA3Y2IzYTQ3MTQ3MTdkOGZkOGMyNmQ2ZjA0MjZk;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXb0AsvHMF4aM/tracks";
//                    total = 75;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DXb0AsvHMF4aM";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/browse/featured-playlists?country=ES&timestamp=2023-07-27T15%3A48%3A25&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 10;
//    };
//}

