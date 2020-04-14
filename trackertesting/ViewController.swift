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
    @IBOutlet weak var imageView: IKImageView!
    
    @objc func panFunction() {
        print("here!!")
    }
    
    var pan = NSPanGestureRecognizer.init(target: imageView, action: #selector("panFunction"))
        
    
    var rotate = NSRotationGestureRecognizer.init(target: imageView, action: #selector(panFunction("rotateFunction")))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // committing
        
        print(pan.translate())
        print(rotate.rotationInDegrees(in: imageView))
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    }
}

