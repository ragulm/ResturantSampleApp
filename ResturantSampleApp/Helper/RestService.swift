//
//  RestService.swift
//  SwiggySampleApp
//
//  Created by M L Ragul on 16/03/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit
import ObjectMapper

class RestService: NSObject {
    
    
    
    func GetVarients(delegate : RestDelegate) {
        let action = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.952423,77.6420603&radius=500&types=food&key=AIzaSyDk5QQ43EuICloR8rctFr5YNiw9Obt0f-A"
        
        HttpClient.sharedInstance.request(action: action, imethod: .get) {
            response, error in
            
            if error == nil {
                if let authResponse = Mapper<MainResult>().map(JSONObject: response) {
                    delegate.success(response: authResponse)
                }
                else {
                    // something happened with the mapping
                    let nsError = NSError(domain: "Mapping error", code: 255, userInfo: ["":""])
                    delegate.fail(error: nsError)
                }
            }
            else {
                let nsError = error! as NSError
                delegate.fail(error: nsError)
            }
            
        }
    }

}
