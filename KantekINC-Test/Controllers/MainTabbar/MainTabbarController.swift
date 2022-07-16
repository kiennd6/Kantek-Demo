//
//  MainTabbarController.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        let homeViewController = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.navigationBar.isHidden = true
        let homeTabbarItem = UITabBarItem()
        homeTabbarItem.title = ""
        homeTabbarItem.image = UIImage(named: "ic_tabbar_home")
        homeViewController.tabBarItem = homeTabbarItem
        
        let settingViewController = SettingViewController.init(nibName: "SettingViewController", bundle: nil)
        let settingNavigationController = UINavigationController(rootViewController: settingViewController)
        settingNavigationController.navigationBar.isHidden = true
        let settingTabbarItem = UITabBarItem()
        settingTabbarItem.title = ""
        settingTabbarItem.image = UIImage(named: "ic_tabbar_setting")
        settingViewController.tabBarItem = settingTabbarItem
        self.viewControllers = [homeNavigationController,settingNavigationController]
        self.tabBar.backgroundColor = .white

    }
    

}
