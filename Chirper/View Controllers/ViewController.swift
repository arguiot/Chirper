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
    @IBOutlet weak var load: NSProgressIndicator!
    
    let token = UserDefaults.standard.string(forKey: "token")
    let profile = UserDefaults.standard.array(forKey: "profile")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        load.isHidden = true
        input.delegate = self as NSTextViewDelegate
        
        print("Using the profile: \(profile) with \(token)")
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
        if token != nil || profile != nil {
            load.isHidden = false
            
            let params = [
                "text": input.string,
                "profile_ids": profile!,
                "now": true
                ] as [String : Any]
            Alamofire.request("https://api.bufferapp.com/1/updates/create.json?access_token=\(token!)", method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
                print(response.result.value)
                
                self.view.window?.performClose(self)
            }
        } else {
            fatalError("Can't find the token or the profile.")
        }
    }

}

