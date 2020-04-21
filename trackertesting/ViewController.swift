//
//  ViewController.swift
//  trackertesting
//
//  Created by Alexander Smith on 4/13/20.
//  Copyright © 2020 SmithPath. All rights reserved.
//

import Cocoa
import AppKit.NSPanGestureRecognizer
import Quartz.ImageKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // committing
        
        let view = MovableImageView()
        view.frame = NSRect(x:0, y:0, width:100, height:100)
        self.view.addSubview(view)
    }
}
