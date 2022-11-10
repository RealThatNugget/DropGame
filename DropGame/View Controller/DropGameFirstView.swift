//
//  ContentView.swift
//  DropGame
//
//  Created by Aird, Margaret on 11/10/22.
//

import SwiftUI

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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
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
