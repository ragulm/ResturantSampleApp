//
//  ViewControllerProtocol.swift
//  ResturantSampleApp
//
//  Created by M L Ragul on 10/04/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    
    func handleErrors(error: NSError)
    func handleUpdateSuccess(variants: MainResult)
    
}
