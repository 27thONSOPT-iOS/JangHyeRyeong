//
//  mainTabBarController.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/12.
//

import UIKit

class mainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }

    func setTabBar(){
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController,
              let partCollectionVC = self.storyboard?.instantiateViewController(identifier: "PartCollectionViewVC") as? PartCollectionViewVC else {
            return
        }
        
        loginVC.tabBarItem.title = "Home"
        loginVC.tabBarItem.image = UIImage(systemName: "house")
        loginVC.tabBarItem.image?.withTintColor(UIColor.yellow)
        loginVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        partCollectionVC.tabBarItem.title = "SOPT+WORKING"
        partCollectionVC.tabBarItem.image = UIImage(systemName: "paperplane")
        partCollectionVC.tabBarItem.selectedImage = UIImage(systemName: "paperplane.fill")
        
        setViewControllers([loginVC, partCollectionVC], animated: true)
        
    }

}
