//
//  TabBarViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 28/05/1443 AH.
//

import UIKit
class TabBarViewController:UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.changRadiusOfTabBar()
        self.changColorTabBar()
    }
//    -------------Radius------------\\
    func changRadiusOfTabBar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 50
        
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
//    =========================Color=========================\\
    
    func changColorTabBar(){
        self.tabBar.unselectedItemTintColor = .black
        
        
        
        
    }
//    ============================TabBar========================\\
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changHaightOfTabBar()
    }
//    =====================hight of TabBar===================\\
    func changHaightOfTabBar(){
        if UIDevice().userInterfaceIdiom == .phone{
            
            var tabFrame = tabBar.frame
            tabFrame.size.height = 90
            tabFrame.origin.y = view.frame.size.height - 90
            tabBar.frame = tabFrame
        }
    }
//    TabBar animition
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleInimitionItem(item)
    }
    func simpleInimitionItem(_ item : UITabBarItem){
        
        guard let barItemView = item.value(forKey: "view") as? UIView else {return}
        let timeInterval: TimeInterval = 0.5
        let propertyAnimmator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5){
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0, y: 0)
        }
        propertyAnimmator.addAnimations({barItemView.transform = .identity},delayFactor: CGFloat(timeInterval))
        propertyAnimmator.startAnimation()
    }
}

