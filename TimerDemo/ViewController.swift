//
//  ViewController.swift
//  TimerDemo
//
//  Created by CoDancer on 2018/12/16.
//  Copyright © 2018年 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index : NSInteger = 1   //tag
    var msgArray = [String]()
    var clickNum : NSInteger = 0
    
    @IBOutlet weak var clickBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        
        clickBtn.layer.cornerRadius = 4.0
        clickBtn.layer.masksToBounds = true
    }

    @IBAction func clickBtnDidTouch(_ sender: UIButton) {
        
        if msgArray.count == 0 {
            
            clickNum = 0
            index = 1
        }
        clickNum = clickNum + 1
        if msgArray.count != 0 {
            
            msgArray.append("显示信息" + String(clickNum))
        }else {
            
            msgArray.append("显示信息" + String(clickNum))
            solveMsgPushShow(index: index)
        }
    }
    
    func solveMsgPushShow(index: NSInteger) {
        
        let msg = msgArray.first
        if msg != nil {
            
            Helper.showPushInfo(msg: msg!, ofTag: index) {
                
                if self.msgArray.count != 0 {
                    
                    self.msgArray.removeFirst()
                }
                
                if self.msgArray.count == 0 {
                    
                    return
                }else {
                    
                    self.index = self.index + 1
                    self.solveMsgPushShow(index: self.index)
                }
            }
        }
    }
    
}

