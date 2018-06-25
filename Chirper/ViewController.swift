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
    
    let BUFFER_CLIENT_ID = "5b2f84ea4f87a6af7d185461"
    let BUFFER_CLIENT_SECRET = "e801eefcf1ff49c27bea9e2587caa238"
    
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

