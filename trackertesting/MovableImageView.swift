//
//  MovableImageView.swift
//  trackertesting
//
//  Created by Alexander Smith on 4/14/20.
//  Copyright © 2020 SmithPath. All rights reserved.
//

import Cocoa

class MovableImageView: NSImageView {
    
    var firstMouseDownPoint: NSPoint = NSZeroPoint
    var panPoint: NSPoint = NSZeroPoint
    var initialRotation: CGFloat = 0
    
    init() {
        super.init(frame: NSZeroRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.red.cgColor
        self.createRotateGestureRecognizer(targetView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTouchGestureRecognizer(targetView: NSImageView) {
        var twoTouch:[String:NSTouch]?
        
    }
    
    func createRotateGestureRecognizer(targetView: NSImageView) {
        Swift.print("rotateInitialize")
        let rotate = NSRotationGestureRecognizer(target: self, action:(#selector(self.handleRotateGesture(_:))))
        targetView.addGestureRecognizer(rotate)
    }
    
    @objc func handleRotateGesture(_ sender: NSRotationGestureRecognizer) {
        //get rotation
        let rotation = sender.rotationInDegrees + initialRotation
        Swift.print("Rotation: ")
        Swift.print(rotation)
        
        self.frameCenterRotation = rotation
        
        if(sender.state.rawValue == 3) {
            initialRotation = rotation
            Swift.print("Rotation Ended")
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing Code
    }
    
    override func mouseDown(with event: NSEvent) {
        Swift.print("mouseDown")
        firstMouseDownPoint = (self.window?.contentView?.convert(event.locationInWindow, to: self))!
    }
    
    override func mouseDragged(with event: NSEvent) {
        Swift.print("mouseDragged")
        let newPoint = (self.window?.contentView?.convert(event.locationInWindow, to: self))!
        let offset = NSPoint(x: newPoint.x - firstMouseDownPoint.x, y: newPoint.y - firstMouseDownPoint.y)
        let origin = self.frame.origin
        let size = self.frame.size
        self.frame = NSRect(x: origin.x + offset.x, y: origin.y + offset.y, width: size.width, height: size.height)
    }

    override func mouseUp(with event: NSEvent) {
        Swift.print("mouseUp")

    }
}
