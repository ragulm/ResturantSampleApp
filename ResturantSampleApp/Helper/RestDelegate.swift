//
//  RestDelegate.swift
//  LenseKartSampleApp
//
//  Created by M L Ragul on 09/04/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit

import Foundation

protocol RestDelegate {
    
    func success(response: Any!)
    func fail(error: NSError)
    
}
