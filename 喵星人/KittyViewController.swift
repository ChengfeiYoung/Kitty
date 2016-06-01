//
//  KittyViewController.swift
//  Kitty
//
//  Created by fei on 16/5/26.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit
//import DetailViewController
class KittyViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var headTitle:String!
    var itemsArray:NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = headTitle;
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:KittyCell = tableView.dequeueReusableCellWithIdentifier("KittyCell") as! KittyCell;
        let item:String = itemsArray[indexPath.row] as! String
//        let name:String = item.stringByAppendingString("_detail")
        cell.imgView.image = UIImage(named: item)
        return cell;
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item:String = itemsArray[indexPath.row] as! String
        
        if (item == "kitty_1" || item == "kitty_3" || item == "dog_1") {
            let detailTableVC:DetailTableViewCotroller = UIStoryboard(name:"Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailTableViewCotroller") as! DetailTableViewCotroller
            let imagesArray:NSMutableArray = NSMutableArray()
            var identifier:String = String()
            switch item {
            case "kitty_1":
                identifier = "kittyCatogory"
                for i in 0..<6 {
                    let string:String = String(format: "kittyCatogory_\(i)")
                    imagesArray.addObject(string)
                }
            case "kitty_3":
                identifier = "toy"
                for i in 0..<9 {
                    let string:String = String(format: "toy_\(i)")
                    imagesArray.addObject(string)
                }
            case "dog_1":
                identifier = "dogCatogory"
                for i in 0..<7 {
                    let string:String = String(format: "dogCatogory_\(i)")
                    imagesArray.addObject(string)
                }
            default:
                break
            }
            detailTableVC.imagesArray = imagesArray;
            detailTableVC.identifier = identifier
            self.navigationController?.pushViewController(detailTableVC, animated: true)
        } else {
            let name:String = item.stringByAppendingString("_detail")
            let detailVC = DetailViewController()
            detailVC.imageName = name
            self.navigationController!.pushViewController(detailVC, animated: true);
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300;
    }

    
}
