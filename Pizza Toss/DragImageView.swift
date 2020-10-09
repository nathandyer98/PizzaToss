//
//  DragImageView.swift
//  PewPew Birds
//
//  Created by nd17aak on 10/01/2020.
//  Copyright © 2020 nd17aak. All rights reserved.
//

import UIKit

class DragImageView: UIImageView {
    
    var myDelegate: subviewDelegate?
    var startLocation: CGPoint?
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    var resetAim = CGPoint(x: 60, y: UIScreen.main.bounds.height*0.5)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLocation = touches.first?.location(in: self)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentLocation = touches.first?.location(in: self)
        
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        var newCenter = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        self.myDelegate?.BallAngle(currentLocation: newCenter)
        

        let halfx = self.bounds.midX
        newCenter.x = max(halfx, newCenter.x)
        newCenter.x = min((W * 0.15), newCenter.x)
        
        //let halfy = self.bounds.midY
        newCenter.y = max((H * 0.40), newCenter.y)
        newCenter.y = min((H * 0.60), newCenter.y)
        
        self.center = newCenter
        
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        self.center = resetAim
        self.myDelegate?.createBall()

    }
}

