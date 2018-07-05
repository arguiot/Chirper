//
//  MediaVC.swift
//  Chirper
//
//  Created by Arthur Guiot on 05/07/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class MediaVC: NSViewController {

    @IBOutlet weak var url: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        url.stringValue = UserDefaults.standard.string(forKey: "url") ?? ""
    }
    @IBAction func Done(_ sender: Any) {
        UserDefaults.standard.set(url.stringValue, forKey: "url")
        print(UserDefaults.standard.string(forKey: "url"))
        self.dismiss(self)
    }
    
}
