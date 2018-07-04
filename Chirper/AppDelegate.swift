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
        
        if UserDefaults.standard.string(forKey: "token") == nil ||  UserDefaults.standard.array(forKey: "profile") == nil {
            let window = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "InitWindow") as! NSWindowController
            WC = window
            WC?.showWindow(self)
            WC?.window?.makeKey()
        } else {
            statusItem.menu = self.menu
        }
    }
    @IBAction func Open(_ sender: Any) {
        let window = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ChirperWindow") as! NSWindowController
        WC = window
        WC?.showWindow(self)
        self.WC?.window?.titleVisibility = .hidden
        self.WC?.window?.backgroundColor = #colorLiteral(red: 0.2128759027, green: 0.2128818035, blue: 0.2128786147, alpha: 1)
        WC?.window?.makeKey()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func emptyDefaults() { // test only
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
    }
}

