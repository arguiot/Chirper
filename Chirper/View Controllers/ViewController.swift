//
//  ViewController.swift
//  Chirper
//
//  Created by Arthur Guiot on 24/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa
import Alamofire
class ViewController: NSViewController, NSTextViewDelegate {
    let tweet = 280
    
    @IBOutlet var input: NSTextView!
    @IBOutlet weak var progress: NSProgressIndicator!
    
    
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
    @IBAction func SendTweet(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "token") != nil {
            
        }
    }

}

