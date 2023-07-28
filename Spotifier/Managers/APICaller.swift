//
//  APICaller.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation


final class APICaller{
    static let shared = APICaller()
    
    private init() {}
    
    struct Constants{
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    
    enum APIError: Error{
        case failedToGetData
        
    }
    
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void){
        createRequest(
            with: URL(string: Constants.baseAPIURL + "/me"),
            type: .GET
        ) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest){ data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    //let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print("User profile response -> \(result)")
                    completion(.success(result))
                }
                catch {
                    print("Get user profile response error ->")
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getNewReleases(completion: @escaping ((Result<NewReleasesResponse, Error>)) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/new-releases?limit=50"),
                      type: .GET
        ) {
            request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    //let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
                    let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
//                    print("GetNewReleases response ->")
//                    print(result)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getFeaturedPlaylists(completion: @escaping ((Result<FeaturedPlaylistResponse,Error>)->Void)){
        createRequest(
            with: URL(string: Constants.baseAPIURL + "/browse/featured-playlists?limit=20"),
            type: .GET
        ){ request in
            let task = URLSession.shared.dataTask(with: request){ data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    //let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
                    let result = try JSONDecoder().decode(FeaturedPlaylistResponse.self, from: data)
//                    print("Get featured playlist response ->")
//                    print(result)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                    print("Get featured playlist error ->")
                    print(error)
                }
            }
            task.resume()
        }
    }
    
    public func getRecommendations (genres: Set<String>, completion: @escaping ((Result<RecommendationsResponse, Error>)-> Void)){
        let seeds = genres.joined(separator: ",")
//        print("Get seeds ->")
//        print(seeds)
        createRequest(
            with: URL(string: Constants.baseAPIURL + "/recommendations?seed_genres=\(seeds)"),
            type: .GET
        ){ request in
            let task = URLSession.shared.dataTask(with: request){ data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    //let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
                    let result = try JSONDecoder().decode(RecommendationsResponse.self, from: data)
//                    print("Get recommended genres response ->")
//                    print(result)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                    print("Get recommended genres error ->")
                    print(error)
                }
            }
            task.resume()
            
        }
    }
    
    public func getRecommendedGenres(completion: @escaping ((Result<RecommendedGenres, Error>)-> Void)){
        createRequest(
            with: URL(string: Constants.baseAPIURL + "/recommendations/available-genre-seeds"),
            type: .GET
        ){ request in
            let task = URLSession.shared.dataTask(with: request){ data, _, error in
                guard let data = data, error == nil else{
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    //let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
                    let result = try JSONDecoder().decode(RecommendedGenres.self, from: data)
//                    print("Get recommended genres response ->")
//                    print(result)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                    print("Get recommended genres error ->")
                    print(error)
                }
            }
            task.resume()
            
        }
    }
    
    // MARK: - Private
    
    enum HTTPMethod: String{
        case GET
        case POST
    }
    
    private func createRequest(
        with url: URL?,
        type: HTTPMethod,
        completion: @escaping(URLRequest)->Void
    ) {
        AuthManager.shared.withValidToken{ token in
            guard let apiURL = url else{
                return
            }
            
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)",
                             forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
}
