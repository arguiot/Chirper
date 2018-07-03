//
//  Welcome.swift
//  Chirper
//
//  Created by Arthur Guiot on 03/07/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class Welcome: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if UserDefaults.standard.string(forKey: "token") != nil {
            self.view.window?.performClose(self)
        }
    }
    func close() {
        self.view.window?.performClose(self)
    }
    
}
