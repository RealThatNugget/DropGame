//
//  GameScene.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/10/22.
//

import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate
{
    private var colorMask : Int = 0b0000
    
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches : Set<UITouch>, with event : UIEvent?) -> Void
    {
        guard let touch = touches.first
        else { return }
        
        let currentColor = assignColorAndBitmask()
        let width = Int (arc4random() % 50)
        let height = Int (arc4random() % 50)
        let location = touch.location(in: self)
        
        let node : SKSpriteNode
        node = SKSpriteNode(color: currentColor, size: CGSize(width: width, height: height))
        node.position = location
        
        node.physicsBody = SKPhysicsBody(rectangleOf:CGSize(width: width, height: height))
        
        addChild(node)
    }
    
    private func assignColorAndBitmask() -> UIColor{
        let colors: [UIColor] = [.green, .black, .red, .orange, .systemPink, .darkGray, .blue, .cyan, .purple]
        let randomIndex = Int(arc4random()) % colors.count
        
        return colors[randomIndex]
    }
}
