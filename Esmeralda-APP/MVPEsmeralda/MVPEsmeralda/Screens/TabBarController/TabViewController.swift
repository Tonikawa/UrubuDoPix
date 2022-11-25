//
//  TabViewController.swift
//  MVPEsmeralda
//
//  Created by Gabriel Batista on 08/09/22.
//

import Foundation
import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.backgroundColor = .white
        
        // Create Tab one
        let tabOne = MVPHomeViewController()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = MVPCardapioViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Cardápio", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab three
        let tabThree = FavoriteViewController()
        let tabThreeBarItem3 = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        tabThree.tabBarItem = tabThreeBarItem3
        
        // Create Tab four
        let tabFour = PerfilViewController()
        let tabFourBarItem4 = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        tabFour.tabBarItem = tabFourBarItem4
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Home")
    }
}
