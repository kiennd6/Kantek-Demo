//
//  UserViewModel.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import Foundation

class LoginViewModel : NSObject {
    
    let onboardingServices: OnboardingServices = OnboardingServices()
    
    var userData: UserData! {
        didSet {
            UserDefaults.standard.set(userData.token, forKey: "token")
        }
    }
    
    typealias authenticationLoginCallBack = (_ status:Bool, _ message:String) -> Void
    var loginCallback:authenticationLoginCallBack?
    
    func authenticateUserWith(email: String, password: String) {
        onboardingServices.login(email: email, password: password) { response in
            guard let response = response else {
                return
            }
            switch response.data {
            case .userData(let data):
                self.userData = data
            default:
                break
            }
            if response.result {
                self.loginCallback?(true, response.message)
            } else {
                self.loginCallback?(false, response.message)
            }
        }
    }
    
    func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
        self.loginCallback = callBack
    }
    
}
