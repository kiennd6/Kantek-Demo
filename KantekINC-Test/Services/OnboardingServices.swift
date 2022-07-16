//
//  OnboardingServices.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import Foundation
import UIKit

class OnboardingServices: NSObject {
    
    static let shared = OnboardingServices()
    
    func login(email: String, password: String, completion: @escaping(UserLoginResponse?) -> Void) {
        let urlString = String(format: "https://stage3.doctors.kendemo.com/api/v1/auth/sponsor/login")
        guard let serviceUrl = URL(string: urlString) else { return }
        let parameterDictionary = ["email" : email, "password" : password]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let loginData = try JSONDecoder().decode(UserLoginResponse.self, from: data)
                    completion(loginData)
                } catch let err {
                    print("===> Err", err)
                }
            }
        }.resume()
    }
    
}
