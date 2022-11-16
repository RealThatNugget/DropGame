//
//  ContentView.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/10/22.
//

import SwiftUI
import SpriteKit

struct DropGameFirstView: View
{
    let width : CGFloat = 300
    let height : CGFloat = 500
    
    private var simpleScene : GameScene
    {
        let scene = GameScene()
        scene.size = CGSize(width: width, height: height)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View
    {
        VStack
        {
            Text("Drop Game WOAHH")
            SpriteView(scene: simpleScene)
                .frame(maxWidth: UIDevice.current.userInterfaceIdiom != .pad ? width : .infinity, maxHeight: UIDevice.current.userInterfaceIdiom != .pad ? height : .infinity)
        }
        .padding()
    }
}

struct DropGameFirstView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DropGameFirstView()
    }
}
