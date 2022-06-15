//
//  TabbarViewController.swift
//  SigaTrilha
//
//  Created by Thiago Valentim on 21/04/22.
//

import UIKit

class TabBarVC:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBarController()
    }
    
    private func setUpTabBarController(){
        // Criando constantes para serem passados no Array
//        let screen01 = HomeVC()
//        let screen02 = RecordTrailVC()
//        let screen03 = ProfileVC()
//        let screen03 = UINavigationController(rootViewController: ProfileScreen())
//        self.setViewControllers([screen01,screen02,screen03], animated: false)
        self.tabBar.backgroundColor = UIColor(red: 228/255, green: 228/255, blue: 212/255, alpha: 1.0) // da tabbar
        self.tabBar.tintColor = .black
        self.tabBar.isTranslucent = false
        guard let items = tabBar.items else {return}
        items[0].image = UIImage(systemName: "person.circle")
        items[0].title = "Home"
        items[1].image = UIImage(systemName: "globe.americas")
        items[1].title = "RecordTrail"
        items[2].image = UIImage(systemName: "person.text.rectangle")
        items[2].title = "Profile"
    }
}








