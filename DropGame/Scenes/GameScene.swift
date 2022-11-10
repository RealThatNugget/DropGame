//
//  GameScene.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/10/22.
//

import SpriteKit

class GameScene : SKScene
{
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches : Set<UITouch>, with event : UIEvent?) -> Void
    {
        
    }
}
