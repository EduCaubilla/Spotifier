//
//  AuthManager.swift
//  Spotifier
//
//  Created by Edu Caubilla on 20/07/2023.
//

import Foundation


final class AuthManager{
    
    struct Constants {
        static let clientID = "241b109723d14a4490149306e8b7f2ec"
        static let clientSecret = "508f30d334ca43f78e40d608a2a461c8"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"

    }
    
    static let shared = AuthManager()
    
    private init(){}
    
    var isSignedIn: Bool{
        return false
    }
    
    public var signInURL: URL?{
        let scope = "user-read-private"
        let baseURI = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://educaubilla.netlify.app"
        let string = "\(baseURI)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    private var accessToken: String?{
        return nil
    }
    
    private var refreshToken: String?{
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool{
        return false
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
            URLQueryItem(name: "redirect_uri", value: "https://educaubilla.netlify.app"),
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
        
        let task = URLSession.shared.dataTask(with: request){data, _, error in
            guard let data = data,
                  error == nil else{
                completion(false)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(
                    with: data,
                    options: .allowFragments)
                
                print("SUCCESS -> \(json)")
                completion(true)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    public func refreshAccessToken(){
        
    }
    
    private func cacheToken(){
        
    }
    
}
