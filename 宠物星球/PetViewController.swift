//
//  PetViewController.swift
//  Kitty
//
//  Created by fei on 16/5/26.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit

class PetViewController: UIViewController, UICollectionViewDelegate {
    var itemsArray:NSMutableArray!
    @IBOutlet weak var collectioView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "宠物星球"
        // Do any additional setup after loading the view.
        itemsArray = NSMutableArray()
        for(var i=1; i<=6 ; i++) {
            let str = String(format: "pet_\(i)")
            itemsArray.addObject(str)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PetCell = collectionView.dequeueReusableCellWithReuseIdentifier("PetCell", forIndexPath: indexPath) as! PetCell
        let item:String = itemsArray[indexPath.row] as! String
        cell.imgView.image = UIImage(named: item)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item:String = itemsArray[indexPath.row] as! String
        let name:String = item.stringByAppendingString("_detail")
        let detailVC = DetailViewController()
        detailVC.imageName = name
        self.navigationController!.pushViewController(detailVC, animated: true);
    }
    
}
