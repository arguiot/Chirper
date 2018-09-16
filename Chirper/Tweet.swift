//
//  Tweet.swift
//  Chirper
//
//  Created by Arthur Guiot on 15/9/18.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class Tweet: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        self.layer?.backgroundColor = #colorLiteral(red: 0, green: 0.3450980484, blue: 0.8156862855, alpha: 1)
    }
    
}
