//
//  HintView.swift
//  Kitty
//
//  Created by fei on 16/5/28.
//  Copyright © 2016年 ChengFei. All rights reserved.
//

import UIKit

protocol HintViewDelegate: NSObjectProtocol {
    func hintViewBack()
}

class HintView: UIView {
    
     var delegate:HintViewDelegate?
    
     init(frame: CGRect, imageName:String) {
        super.init(frame: frame)
        let backView:UIView = UIView(frame:UIScreen.mainScreen().bounds)
        backView.backgroundColor = UIColor.whiteColor()
//        backView.backgroundColor = UIColor.clearColor()
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(HintView.back))
        backView.addGestureRecognizer(tap)
        self.addSubview(backView)
        
        let imageView:UIImageView = UIImageView(frame: UIScreen.mainScreen().bounds)
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        backView.addSubview(imageView)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func back() {
        delegate?.hintViewBack()
    }
    
}
