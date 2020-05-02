//
//  GameScene.swift
//  DiveIntoSpriteKit
//
//  Created by Paul Hudson on 16/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import SpriteKit

@objcMembers
class GameScene: SKScene {
    
    // PROPERTIES
    var touchingPlayer = false
    let player = SKSpriteNode()
    
    // METHODS
    override func didMove(to view: SKView) {
        let player = SKSpriteNode(imageNamed: "player-submarine.png")
        var touchingPlayer = false
        player.position.x = -400
        player.zPosition = 1
        addChild(player)
        // this method is called when your game scene is ready to run
        let background = SKSpriteNode(imageNamed: "water.jpg")
        background.zPosition = -1
        addChild(background)
        
        if let particles = SKEmitterNode(fileNamed: "Bubbles") {
            particles.advanceSimulationTime(10)
            particles.position.x = 512
            addChild(particles)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user touches the screen
        guard let touch = touches.first else {return}
        
        //If a touch can't be read the method will exit immediately
        
        
        //Find the location of the touch
        let location = touch.location(in: self)
        
        //Find the list of nodes that are at that location
        let tappedNodes = nodes(at: location)
        
        //Set touchingPlayer to true
        if tappedNodes.contains(player) {
            touchingPlayer = true
            guard touchingPlayer else {return}
            guard let touch = touches.first else {return}
            
            
            //find the location where the touch took place inside our game scene
            let location = touch.location(in: self)
            player.position = location
            
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user stops touching the screen
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // this method is called before each frame is rendered
    }
    
    
}





