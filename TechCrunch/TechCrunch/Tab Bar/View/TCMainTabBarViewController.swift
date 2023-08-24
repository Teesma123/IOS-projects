//
//  TCMainTabBarViewController.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import Foundation
import UIKit

class VCMainTabBarViewController: UITabBarController {
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        delegate = self
    }
    
    //MARK: - Setup UI
    private func setupTabBar() {
        //Home
        let homeController = TCNewsListViewController()
        let homenavController = UINavigationController(rootViewController: homeController)
        let homeImage = UITabBarItem(title: "Home", image: UIImage(named: "homeBlackIcon")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "homeGreenIcon")?.withRenderingMode(.alwaysOriginal))
        homeImage.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemTeal, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .light)], for: .selected)
        homeImage.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkText, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10, weight: .bold)], for: .normal)
        homenavController.tabBarItem = homeImage
        
        //Saved List
        let savedNews = TCSavedNewsViewController()
        let savedNewsNav = UINavigationController(rootViewController: savedNews)
        let savedNewsImage = UITabBarItem(title: "Saved", image: UIImage(named: "savedIconBlack")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "sevedIconGreen")?.withRenderingMode(.alwaysOriginal))
        savedNewsImage.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemTeal, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .light)], for: .selected)
        savedNewsImage.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkText, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .bold)], for: .normal)
        savedNewsNav.tabBarItem = savedNewsImage
     
        let controllers = [homenavController, savedNewsNav]
        self.viewControllers = controllers
    }
    
}
//MARK: - UITabBarControllerDelegate
extension VCMainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
