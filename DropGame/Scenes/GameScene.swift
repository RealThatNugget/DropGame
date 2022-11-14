//
//  GameScene.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/10/22.
//

import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate
{
    
    //MARK: - Data Members
    private var colorMask : Int = 0b0000
    
    private let scoreNode : SKLabelNode = SKLabelNode(fontNamed: "Copperplate-Bold")
    
    private var score : Int = -0
    {
        didSet
        {
            scoreNode.text = "Score: \(score)!"
        }
    }
    
    
    //MARK: - sKScene Methods
    override func didMove(to view : SKView) -> Void
    {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        scoreNode.zPosition = 2
        scoreNode.position.x = 150
        scoreNode.position.y = 480
        addChild(scoreNode)
        score = 0
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
        node.physicsBody?.contactTestBitMask = UInt32(colorMask)
        
        addChild(node)
    }
    
    //MARK: - Game Methods
    
    private func assignColorAndBitmask() -> UIColor{
        let colors: [UIColor] = [.green, .black, .red, .orange, .systemPink, .darkGray, .blue, .cyan, .purple]
        let randomIndex = Int(arc4random()) % colors.count
        colorMask = randomIndex + 1
        
        return colors[randomIndex]
    }
    
    //MARK: - Collision Methods
    
    private func explosionEffect(at location : CGPoint) -> Void
    {
        if let explosion = SKEmitterNode(fileNamed: "SparkParticle")
        {
            explosion.position = location
            addChild(explosion)
            
            let waitTime = SKAction.wait(forDuration: 5)
            let removeExplosion = SKAction.removeFromParent()
            let explosiveSequence = SKAction.sequence([waitTime, removeExplosion])
            
            explosion.run(explosiveSequence)
        }
    }
    
    private func annihilate(deadNode : SKNode) -> Void
    {
        deadNode.removeFromParent()
        score += 10
    }
    
    private func collisionBetween(_ nodeOne : SKNode, and nodeTwo : SKNode) -> Void
    {
        if (nodeOne.physicsBody?.contactTestBitMask == nodeTwo.physicsBody?.contactTestBitMask)
        {
            annihilate(deadNode: nodeOne)
            annihilate(deadNode: nodeTwo)
        }
        
    }
    
    func didBegin(_ contact : SKPhysicsContact) -> Void
    {
        guard let first = contact.bodyA.node else { return }
        guard let second = contact.bodyB.node else { return }
        
        collisionBetween(first, and: second)
    }
}
