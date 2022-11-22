//
//  GameViewController.swift
//  Snake8les
//
//  Created by Christina  on 07.07.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        
        let skView = view as! SKView
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
    }

   
}
