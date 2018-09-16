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
        UserDefaults.standard.removeObject(forKey: "url")
        
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
        Tweet(sender, true)
    }
    
    func Tweet(_ sender: Any, _ buff: Bool = true) {
        if token != nil || profile != nil {
            load.isHidden = false
            
            var params = [
                "text": input.string,
                "profile_ids": profile!,
                "now": buff
            ] as [String : Any]
            if UserDefaults.standard.string(forKey: "url") != nil {
                params["media"] = [
                    "photo": UserDefaults.standard.string(forKey: "url")!
                ]
            }
            Alamofire.request("https://api.bufferapp.com/1/updates/create.json?access_token=\(token!)", method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
                
                print(response.result.value)
                if (response.result.value! as AnyObject)["success"] as! Bool != true {
                    self.load.isHidden = true
                    self.dialogOKCancel(question: "Error", text: (response.result.value! as AnyObject)["message"] as! String)
                } else {
                    self.view.window?.performClose(self)
                }
            }
        } else {
            fatalError("Can't find the token or the profile.")
        }
    }
    
    @IBAction func buffer(_ sender: Any) {
        Tweet(sender, false)
    }
    
    func dialogOKCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        return alert.runModal() == .alertFirstButtonReturn
    }
}

