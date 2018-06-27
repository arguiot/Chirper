//
//  AuthVC.swift
//  Chirper
//
//  Created by Arthur Guiot on 26/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa
import WebKit

class AuthVC: NSViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var WebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        WebView.uiDelegate = self
        WebView.navigationDelegate = self
        
        
        self.WebView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.WebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        let creds = BufferCred();
        let url = URL(string: creds.requestURL!)
        let request = URLRequest(url: url!)
        
        WebView.load(request)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            // When page load finishes. Should work on each page reload.
            if (self.WebView.estimatedProgress == 1) {
                observeURL(self.WebView.url!)
            }
        }
    }
    func observeURL(_ url: URL) {
        print(url.host!)
        if url.host! == "twitter.com" {
            cancel(nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any?) {
        self.dismiss(self)
    }
}
