//
//  AppDelegate.swift
//  Chirper
//
//  Created by Arthur Guiot on 24/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    @IBOutlet weak var menu: NSMenu!
    var WC: NSWindowController?
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("Chirper"))
        }
        statusItem.menu = self.menu
    }
    @IBAction func OpenWindow(_ sender: Any) {
        let window = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ChirperWindow") as! NSWindowController
        WC = window
        WC?.showWindow(self)
        print(WC?.window?.title)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

