//
//  DiaryBaseCollecitionViewController.swift
//  Diary
//
//  Created by kevinzhow on 15/4/26.
//  Copyright (c) 2015年 kevinzhow. All rights reserved.
//

import UIKit

class DiaryBaseCollecitionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadCollectionView", name: "DiaryChangeFont", object: nil)
        
        var mDoubleUpRecognizer = UITapGestureRecognizer(target: self, action: "popBack")
        mDoubleUpRecognizer.numberOfTapsRequired = 2
        self.collectionView?.addGestureRecognizer(mDoubleUpRecognizer)
        // Do any additional setup after loading the view.
    }
    
    func popBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func reloadCollectionView() {
        println("reloadData")
        self.collectionView?.reloadData()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == UIEventSubtype.MotionShake {
            println("Device Shaked")
            return
            showAlert()
        }
    }
    
    func showAlert() {
        var alert = UIAlertController(title: "设置", message: "希望切换字体吗", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "算啦", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "好的", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                println("default")
                toggleFont()
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))
    }
}
