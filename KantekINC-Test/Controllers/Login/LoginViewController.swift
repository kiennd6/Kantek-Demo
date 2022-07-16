//
//  LoginViewController.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBAction func handleTapLoginButton(_ sender: Any) {
        self.lblMessage.isHidden = true
        guard let email = self.tfEmail.text else {return}
        guard let password = self.tfPassword.text else {return}
        self.startLoadingView()
        loginViewModel.loginCompletionHandler { [weak self] (status, message) in
            guard let `self` = self else { return }
            self.stopLoadingView()
            DispatchQueue.main.async {
                if status {
                    self.goToMainTabbar()
                } else {
                    self.lblMessage.text = message
                    self.lblMessage.isHidden = false
                }
            }
        }
        loginViewModel.authenticateUserWith(email: email, password: password)
    }
    
    let loginViewModel = LoginViewModel()
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    
    private func configUI() {
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0.0)
        ])
    }
    
    private func startLoadingView() {
        self.activityIndicatorView.isHidden = false
        self.activityIndicatorView.startAnimating()
    }
    
    private func stopLoadingView() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
        }
    }
    
    private func goToMainTabbar(){
        let tabbarViewController = MainTabbarController()
        if let sceneDelegate = self.sceneDelegate {
            sceneDelegate.window?.rootViewController = tabbarViewController
        }
    }
    
    
}

