//
//  EndGameScene.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/14/22.
//

import SpriteKit

class EndGameScene : SKScene{
    var score : Int = 0
    
    override func didMove(to view : SKView) -> Void
    {
        backgroundColor = .red
        
        let scoreNode = SKLabelNode(fontNamed: "Papyrus")
        scoreNode.zPosition = 2
        scoreNode.position.x = frame.midX
        scoreNode.position.y = frame.midY + 35
        scoreNode.fontSize = 20
        scoreNode.color = .black
        scoreNode.text = "Score: \(score)"
        
        let endNode = SKLabelNode(fontNamed: "Impact")
        endNode.zPosition = 2
        endNode.position.x = frame.midX
        endNode.position.y = frame.midY + 8
        endNode.fontSize = 25
        endNode.color = .darkGray
        endNode.text = "GAME OVER."
        
        let restartNode = SKLabelNode(fontNamed: "AcademyEngravedLetPlain")
        restartNode.zPosition = 2
        restartNode.position.x = frame.midX
        restartNode.position.y = frame.midY - 15
        restartNode.fontSize = 20
        restartNode.color = .black
        restartNode.text = "Pinch to restart!"
        
        addChild(scoreNode)
        addChild(endNode)
        addChild(restartNode)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.view?.addGestureRecognizer(pinchRecognizer)
    }
    
    private func restart() -> Void
    {
        let transition = SKTransition.fade(with: .purple, duration: 12)
        let restartScene = GameScene()
        restartScene.size = CGSize(width: 300, height: 500)
        restartScene.scaleMode = .fill
        self.view?.presentScene(restartScene, transition: transition)
    }
    
    @objc
    private func handlePinch(recognizer: UIPinchGestureRecognizer) -> Void
    {
        if recognizer.state == .ended
        {
            restart()
        }
    }
}
