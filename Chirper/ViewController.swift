//
//  ViewController.swift
//  Chirper
//
//  Created by Arthur Guiot on 24/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {
    let tweet = 280
    
    @IBOutlet var input: NSTextView!
    @IBOutlet weak var progress: NSProgressIndicator!
    
    let TWITTER_CONSUMER_KEY = "Ct3RdZk8C9n9fY0hYCzqjtNk6"
    let TWITTER_CONSUMER_SECRET = "DgMiCq3Hnmmj1CPV0qeOWpLHZqM6rJqI3asE2DLreRnjWmtGHe"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        input.delegate = self as NSTextViewDelegate
        

    }
    func textDidChange(_ notification: Notification) {
        if input.string.count > tweet {
            input.string = String(input.string.prefix(tweet))
        }
        progress.doubleValue = Double(input.string.count)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

