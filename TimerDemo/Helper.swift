//
//  Helper.swift
//  TimerDemo
//
//  Created by CoDancer on 2018/12/16.
//  Copyright © 2018年 IOS. All rights reserved.
//

import UIKit

var SCREEN_WIDTH : CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let MAINSCREEN = UIScreen.main.bounds

class Helper: NSObject {
    
    class func showPushInfo(msg: String, ofTag index: NSInteger, completeBlock: (() -> Swift.Void)? = nil) {
        
        let label = UILabel()
        label.tag = 999 + index
        label.text = msg
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .orange
        label.sizeToFit()
        label.leftX = 20
        label.bottomY = SCREEN_HEIGHT
        
        let button = UIButton()
        button.tag = 9999 + index
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.setTitle(msg, for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setImage(UIImage.init(named: "40"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5)
        button.sizeToFit()
        button.leftX = 20
        button.bottomY = 0
        
        let rootWindow : UIWindow = ((UIApplication.shared.delegate?.window)!)!
        rootWindow.addSubview(label)
        rootWindow.addSubview(button)
        
        UIView.animate(withDuration: 0.3, animations: {  //显示动画
            
            label.bottomY = SCREEN_HEIGHT - 20
            button.topY = 30
        }) { (finish) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {     // 线程延时器
                
                DispatchQueue.main.async {     // 获取主线程
                    
                    dismissPushInfoOfTag(index: index, completeBlock: completeBlock)
                }
            })
        }
    }
    
    class func dismissPushInfoOfTag(index: NSInteger, completeBlock: (() -> Swift.Void)? = nil) {
        
        let rootWindow : UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let label = rootWindow.viewWithTag(999 + index)
        let button = rootWindow.viewWithTag(9999 + index)
        UIView.animate(withDuration: 0.3, animations: {  //消失动画
            
            label?.topY = SCREEN_HEIGHT
            button?.bottomY = 0
        }) { (finish) in
            
            label?.removeFromSuperview()
            button?.removeFromSuperview()
            
            if completeBlock != nil {
                
                completeBlock!()
            }
        }
    }

}
