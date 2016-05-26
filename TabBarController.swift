//
//  TabBarController.swift
//  Kitty
//
//  Created by fei on 16/5/26.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let kittyVC:KittyViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("KittyViewController") as! KittyViewController
        kittyVC.headTitle = "喵星人"
        let kittysArray:NSMutableArray = NSMutableArray()
        for(var i=1; i<=6;i+=1) {
            let string:String = String(format: "kitty_\(i)");
            kittysArray.addObject(string)
        }
        kittyVC.itemsArray = kittysArray
        self.setupChildVC(kittyVC, title: "喵星人", image: "kitty_unselect", selectedImage: "kitty_select")
        
        
        
        let petVC:UIViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("PetViewController")
        self.setupChildVC(petVC, title: "宠物星球", image: "pet_unselect", selectedImage: "pet_select")
        
        
        
        let dogVC:KittyViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("KittyViewController") as! KittyViewController
        dogVC.headTitle = "汪星人"
        let dogsArray:NSMutableArray = NSMutableArray()
        for(var i=1; i<=6;i+=1) {
            let string:String = String(format: "dog_\(i)");
            dogsArray.addObject(string)
        }
        dogVC.itemsArray = dogsArray
        self.setupChildVC(dogVC, title: "汪星人", image: "dog_unselect", selectedImage: "dog_select")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    // 添加子控制器到 tabBarController
    func setupChildVC(vc:UIViewController, title:String, image:String, selectedImage:String) {
        // 设置文字和图片
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named:image)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:selectedImage)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
       // 设置文字的样式 (选中以及未选中时的颜色) 243 152 6
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 243/255.0, green: 152/255.0, blue: 6/255.0, alpha: 1)], forState: UIControlState.Normal)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 243/255.0, green: 152/255.0, blue: 6/255.0, alpha: 1)], forState: UIControlState.Selected)
        let nav:UINavigationController = UINavigationController(rootViewController:vc)
        self.addChildViewController(nav)
    }
    
}
