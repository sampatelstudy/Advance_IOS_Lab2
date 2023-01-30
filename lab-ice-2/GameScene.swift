//  GameScene.swift
//  lab 2
//  Created by Samir Patel on 2023-01-28.

import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    var ocean1: Ocean?
    var ocean2: Ocean?
    var player: Player?
    var island: Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad()
    {
        screenWidth = frame.width
        screenHeight = frame.height
        print("Screen Width: \(String(describing: screenWidth))")
        print("Screen Height: \(String(describing: screenHeight))")
        
        name = "GAME"
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        ocean2 = Ocean()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        player = Player()
        addChild(player!)
        
        island = Island()
        addChild(island!)
        
        for _ in 0...2
        {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        for cloud in clouds
        {
            cloud.Update()
        }
        
    }
}
