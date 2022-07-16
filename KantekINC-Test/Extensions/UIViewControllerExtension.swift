//
//  UIViewControllerExtension.swift
//  KantekINC-Test
//
//  Created by kiennd on 16/07/2022.
//

import Foundation
import UIKit

extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
}
