//
//  DetailTableViewCotroller.swift
//  Kitty
//
//  Created by fei on 16/5/28.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit

class DetailTableViewCotroller: UITableViewController, HintViewDelegate {
    var identifier:String!
    var hintView:HintView!
    var imagesArray:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imagesArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:DetailCell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath) as! DetailCell
        let name:String = imagesArray.objectAtIndex(indexPath.row) as! String
        cell.imgView?.image = UIImage(named: name)
        print(cell.imageView?.frame)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        switch identifier {
        case "kittyCatogory":
            if indexPath.row > 0 {
                let name:String = imagesArray.objectAtIndex(indexPath.row) as! String
                let hintImageName = name.stringByAppendingString("_show")
                self.showHintView(hintImageName)
            }
        case "toy":
            if indexPath.row > 1 {
                let name:String = imagesArray.objectAtIndex(indexPath.row) as! String
                let hintImageName = name.stringByAppendingString("_show")
                self.showHintView(hintImageName)
            }
        case "dogCatogory":
            if indexPath.row > 0 {
                let name:String = imagesArray.objectAtIndex(indexPath.row) as! String
                let hintImageName = name.stringByAppendingString("_show")
                self.showHintView(hintImageName)
            }
            
        default:
            break;
        }
        
    }
    
    func showHintView(imageName:String) {
        hintView =  HintView.init(frame: UIScreen.mainScreen().bounds, imageName:imageName)
        hintView.delegate = self
        UIApplication.sharedApplication().keyWindow!.addSubview(hintView)
        hintView.alpha = 0
        UIView.animateWithDuration(0.5) { 
            self.hintView.alpha = 1
        }
    }
 
    func hintViewBack() {
        
        hintView.alpha = 1;
        UIView.animateWithDuration(0.5, animations: { 
            self.hintView.alpha = 0;
            }) { (true) in
               self.hintView.hidden = true
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch identifier {
        case "kittyCatogory":
            return 560
        case "toy":
            return 350
        case "dogCatogory":
            return 515
        default:
            return 0
        }

    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
