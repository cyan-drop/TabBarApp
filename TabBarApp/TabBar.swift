//
//  TabBar.swift
//  TabBarApp
//
//  Created by cyan on 2018/10/22.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    let defaultsName = UserDefaults.standard
    let clearBadge = 0
     override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.cyan
        UITabBar.appearance().barTintColor = UIColor.darkGray
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
      
        guard let badgeNum = defaultsName.object(forKey: "Badge") else {
            return
        }
        let badgeValue = badgeNum as! Int
        if badgeValue != 0 {
            tabBar.items![1].badgeValue = String(badgeValue)
        }else{
            defaultsName.set(clearBadge, forKey: "Badge")
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = nil
        defaultsName.set(clearBadge, forKey: "Badge")
    }
    
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
