//
//  DetailViewController.swift
//  Kitty
//
//  Created by fei on 16/5/26.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var imageName:String!
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named:imageName)!
        
        let scrollView = UIScrollView.init(frame: CGRectMake(0, 0,768,1024))
        self.view.addSubview(scrollView)
        
        imageView =  UIImageView(frame: CGRectMake(0, 0,image.size.width,image.size.height))
        scrollView.contentSize = CGSizeMake(image.size.width, image.size.height)
        imageView.image = UIImage(named:imageName)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
