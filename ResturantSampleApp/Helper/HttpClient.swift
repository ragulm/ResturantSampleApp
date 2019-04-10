//
//  HttpClient.swift
//  SwiggySampleApp
//
//  Created by M L Ragul on 16/03/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireImage

class HttpClient: NSObject {
    
    static let sharedInstance : HttpClient = HttpClient()
    var alamoFireManager = Alamofire.SessionManager.default
    
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // -- in sec
        configuration.timeoutIntervalForResource = 60 // -- in sec
        self.alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request(action : String, imethod: HTTPMethod? = .get, completionHandler: @escaping (_ response: AnyObject?, _ error: NSError?) -> ()) {
        let started = NSDate()
        let sUrl = action
        
        self.alamoFireManager.request(sUrl, method : imethod!).validate().responseJSON { response in
            switch response.result {
            case .success(let JSON):
                completionHandler(JSON as? NSDictionary, nil)
            case .failure(let error):
                completionHandler(nil, error as NSError)
            }
            
        }
        
    }
    
    func requestImage(path: String, completionHandler: @escaping (UIImage) -> Void){
        let started = NSDate()
        self.alamoFireManager.request("\(path)").responseImage(imageScale: 1.5, inflateResponseImage: false, completionHandler: {response in
            debugPrint(response.result)
            guard let image = response.result.value else{
                let interval = NSDate().timeIntervalSince(started as Date)
                print(interval)
                print(response.result)
                return
            }
            DispatchQueue.main.async {
                completionHandler(image)
                print("\(path) is loaded")
            }
        })
    }

}
