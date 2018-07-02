//
//  access_token.swift
//  Chirper
//
//  Created by Arthur Guiot on 25/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa
import Alamofire
import WebKit

class AccessToken {
    let creds = BufferCred()
    
    var wkview: WKWebView;
    var token: String?
    init(_ webview: WKWebView) {
        wkview = webview
    }
    func getCode() {
        wkview.evaluateJavaScript("api.getCode()") { (result, error) in
            self.token = result as? String
            self.request(result as! String) // Doing the request
        }
    }
    
    func request(_ token: String) {
        let params: Parameters = [
            "client_id": creds.BUFFER_CLIENT_ID,
            "client_secret": creds.BUFFER_CLIENT_SECRET,
            "redirect_uri": "https://arguiot.github.io/Chirper/api/",
            "code": token,
            "grant_type": "authorization_code"
        ]
        print(params)
        Alamofire.request("https://api.bufferapp.com/1/oauth2/token.json", method: .post, parameters: params, encoding: URLEncoding.default).responseJSON { (response) in
            print(response.request)
            print(response.result.value)
        }
    }
}
