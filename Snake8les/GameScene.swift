//
//  GameScene.swift
//  Snake8les
//
//  Created by Christina  on 07.07.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var snake: Snake?
    
   
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.brown
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        //create button
        
        let CounterClockwiseButton = SKShapeNode()
        CounterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        CounterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        
        CounterClockwiseButton.fillColor = UIColor.blue
        CounterClockwiseButton.strokeColor = UIColor.gray
        CounterClockwiseButton.lineWidth = 10
        CounterClockwiseButton.name = "CounterClockwiseButton"
        self.addChild(CounterClockwiseButton)
        
        //create button2
        
        let ClockWiseButton = SKShapeNode()
        ClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        ClockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        ClockWiseButton.fillColor = .blue
        ClockWiseButton.strokeColor = .gray
        ClockWiseButton.lineWidth = 10
        ClockWiseButton.name = "ClockWiseButton"
        self.addChild(ClockWiseButton)
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
       
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let TouchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(TouchLocation) as? SKShapeNode, touchedNode.name == "ClockWiseButton" || touchedNode.name == "CounterClockwiseButton" else {
                return
            }
            touchedNode.fillColor = .green
            if touchedNode.name == "ClockWiseButton" {
                snake!.moveClockwise()
            } else if touchedNode.name == "CounterClockwiseButton" {
                snake!.moveCounterClockwise()
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let TouchLocation = touch.location(in: self)
            guard let touchedNode = self.atPoint(TouchLocation) as? SKShapeNode, touchedNode.name == "ClockWiseButton" || touchedNode.name == "CounterClockwiseButton" else {
                return
            }
            touchedNode.fillColor = .blue
            
        }
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        snake!.move()
    }
    
    func createApple(){
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 10)))
        
        let apple = Apple(Position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    
    
    
}

extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodies - CollisionCategories.SnakeHead
        switch collisionObject{
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake!.addBody()
            apple?.removeFromParent()
            createApple()
            
        case CollisionCategories.EdgeBody:
            let snakeHead = contact.bodyA.node is SnakeHead ? contact.bodyA.node : contact.bodyB.node
            createSnake()
        case CollisionCategories.Snake:
            let snakeBodyPart = contact.bodyA.node is SnakeBodyPart ? contact.bodyA.node : contact.bodyB.node
            if snakeBodyPart != snake!.body[1] { // не работает если умудриться 
                createSnake()
            }
            
            
            
        default:
            break
        }
        func createSnake(){
            snake?.removeFromParent()
            snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
            self.addChild(snake!)
            
        }
    }
}
