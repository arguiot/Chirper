//
//  Profiles.swift
//  Chirper
//
//  Created by Arthur Guiot on 03/07/2018.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import Foundation
import Alamofire

class Profiles {
    var token: String;
    init(_ token: String) {
        self.token = token
    }
    func getTwitter() {
        let url = "https://api.bufferapp.com/1/profiles.json?access_token=\(token)"
        print(url)
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                var profile = "";
                print(json)
                for i in (json as! Array<Any>) {
                    if (i as AnyObject)["service"] as! String == "twitter" {
                        profile = (i as AnyObject)["id"] as! String
                    }
                }
            }
        }
    }
}
