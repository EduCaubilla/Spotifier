//
//  AuthManager.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation


final class AuthManager{
    static let shared = AuthManager()
    
    private var refreshingToken = false
    
    struct Constants {
        static let clientID = "241b109723d14a4490149306e8b7f2ec"
        static let clientSecret = "508f30d334ca43f78e40d608a2a461c8"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let redirectURI = "https://educaubilla.netlify.app"
        static let scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-library-read%20user-library-modify%20user-read-email%20streaming"

    }
    
    private init(){}
    
    public var signInURL: URL?{
        
        let baseURI = "https://accounts.spotify.com/authorize"
        let string = "\(baseURI)?response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scopes)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool{
        return accessToken != nil
    }
    
    
    private var accessToken: String?{
        return UserDefaults.standard.string(forKey: "access_token")
    }
    
    private var refreshToken: String?{
        return UserDefaults.standard.string(forKey: "refresh_token")
    }
    
    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expiration_date") as? Date
    }
    
    private var shouldRefreshToken: Bool{
        guard let expirationDate = tokenExpirationDate else{
            return false
        }
        
        let currentDate = Date()
        let tokenExpirationOffset: TimeInterval = 300
        return currentDate.addingTimeInterval(tokenExpirationOffset) >= expirationDate
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)){
        //Get Token
        guard let url = URL(string: Constants.tokenAPIURL) else{
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded",
                         forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID + ":" + Constants.clientSecret
        let basicTokenData = basicToken.data(using: .utf8)
        guard let base64String = basicTokenData?.base64EncodedString() else {
            print("Fail to get base64")
            completion(false)
            return
        }
        
        request.setValue("Basic \(base64String)",
                         forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
            guard let data = data,
                  error == nil else{
                completion(false)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                print("Token successfully refreshed")
                self?.cacheToken(result: result)
                completion(true)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    private var onRefreshBlocks = [((String) -> Void)]()
    
    /// Supplies valid token to be used with API Calls
    public func withValidToken(completion: @escaping (String) -> Void){
        guard !refreshingToken else{
            //Append the completion
            onRefreshBlocks.append(completion)
            return
        }
        if shouldRefreshToken{
            //Refresh
            refreshAccessToken{ [weak self] success in
                if let token = self?.accessToken, success {
                    completion(token)
                }
            }
        }
        else if let token = accessToken {
            completion(token)
        }
    }
    
    public func refreshAccessToken(completion: ((Bool) -> Void)?){
        guard !refreshingToken else{
            return
        }
        
        guard shouldRefreshToken else{
            completion?(true)
            return
        }
        
        guard let refreshToken = self.refreshToken else{
            return
        }
        
        //Refresh token
        guard let url = URL(string: Constants.tokenAPIURL) else{
            return
        }
        
        refreshingToken = true
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: refreshToken),
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded",
                         forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = Constants.clientID + ":" + Constants.clientSecret
        let basicTokenData = basicToken.data(using: .utf8)
        guard let base64String = basicTokenData?.base64EncodedString() else {
            print("Fail to get base64")
            completion?(false)
            return
        }
        
        request.setValue("Basic \(base64String)",
                         forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
            self?.refreshingToken = false
            guard let data = data,
                  error == nil else{
                completion?(false)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                self?.cacheToken(result: result)
                self?.onRefreshBlocks.forEach{ $0(result.access_token) }
                self?.onRefreshBlocks.removeAll()
                print("Successfully refreshed")
                completion?(true)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    private func cacheToken(result: AuthResponse){
        UserDefaults.standard.setValue(result.access_token, forKey: "access_token")
        
        if let refresh_token = result.refresh_token {
            UserDefaults.standard.setValue(refresh_token, forKey: "refresh_token")
        }

        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expiration_date")
    }
}
