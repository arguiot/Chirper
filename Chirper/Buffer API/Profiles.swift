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
        
        Alamofire.request(url).responseJSON { (response) in
            if let json = response.result.value {
                var profile = "";
                
                for i in (json as! Array<Any>) {
                    if (i as AnyObject)["service"] as! String == "twitter" {
                        profile = (i as AnyObject)["id"] as! String
                    }
                }
                UserDefaults.standard.set(profile, forKey: "profile")
                
                self.relaunch()
            }
        }
    }
    func relaunch() {
        // relauch
        let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
        let path = url.deletingLastPathComponent().deletingLastPathComponent().absoluteString
        let task = Process()
        task.launchPath = "/usr/bin/open"
        task.arguments = [path]
        task.launch()
        exit(0)

    }
}
