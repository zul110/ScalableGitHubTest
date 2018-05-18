//
//  ErrorModel.swift
//  ScalableGitHubTest
//
//  Created by ZulMacPro on 5/18/18.
//  Copyright © 2018 dotZul. All rights reserved.
//

import Foundation

class ErrorModel {
    var type: ErrorType?
    var statusCode: Int?
    var message: String?
    
    init(errorType: ErrorType, statusCode: Int, message: String) {
        self.type = errorType
        self.statusCode = statusCode
        self.message = message
    }
}
