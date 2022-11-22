//
//  APPLe.swift
//  Snake8les
//
//  Created by Christina  on 07.07.2022.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode {
    init(Position: CGPoint){
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = .red
        strokeColor = .red
        lineWidth = 5
        self.position = Position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
