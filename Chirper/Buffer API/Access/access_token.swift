//
//  access_token.swift
//  Chirper
//
//  Created by Arthur Guiot on 25/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Cocoa
import Alamofire

class AccessToken {
    var client: String;
    var secret: String;
    init(_ client: String, secret: String) {
        self.client = client
        self.secret = secret
    }
    func redirect(link: URL?) -> Bool {
        if let url = link, NSWorkspace.shared.open(url) {
            return true
        }
        return false
    }
}
