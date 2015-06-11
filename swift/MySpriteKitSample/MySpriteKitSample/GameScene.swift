//
//  GameScene.swift
//  MySpriteKitSample
//
//  Created by YasunoriTaga on 2015/06/05.
//  Copyright (c) 2015年 Yasuun. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        var mySprite = SKSpriteNode(imageNamed:"logo.png")
        mySprite.position = CGPoint(x: 360, y:500)
        addChild(mySprite)
        var action = SKAction.rotateToAngle(CGFloat(45 * M_PI), duration: 1)
        mySprite.runAction(action)
        
        var mySpriteScale = SKSpriteNode(imageNamed:"logo.png")
        mySpriteScale.position = CGPoint(x: 100, y:250)
        addChild(mySpriteScale)
        var scaleAction = SKAction.scaleTo(3, duration: 1)
        mySpriteScale.runAction(scaleAction)

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
