//
//  VariantsDelegateImpl.swift
//  SwiggySampleApp
//
//  Created by M L Ragul on 16/03/19.
//  Copyright © 2019 M L Ragul. All rights reserved.
//

import UIKit

class VariantsDelegateImpl: NSObject,VariantsDelegate {
    
     var viewController : ViewControllerProtocol?
    
    func success(response: Any!) {
        viewController?.handleUpdateSuccess(variants: response as! MainResult)
    }
    
    func fail(error: NSError) {
        viewController?.handleErrors(error: error)
    }
    
    
    func getVariantDetail() {
        
        RestService().GetVarients(delegate: self)
    }

}
