//
//  Cred.swift
//  Chirper
//
//  Created by Arthur Guiot on 26/06/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Foundation

class BufferCred {
    let BUFFER_CLIENT_ID = "5b2f84ea4f87a6af7d185461"
    let BUFFER_CLIENT_SECRET = "e801eefcf1ff49c27bea9e2587caa238"
    let redirectURI = "https://arguiot.github.io/Chirper/api"
    let requestURL: String?
    init() {
        requestURL = "https://buffer.com/oauth2/authorize?client_id=\(BUFFER_CLIENT_ID)&redirect_uri=\(redirectURI)&response_type=code"
    }
}
